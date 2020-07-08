package main

import (
	"database/sql"
	"encoding/json"
	"fmt"
	"io/ioutil"
	"log"
	"net/http"

	_ "github.com/go-sql-driver/mysql"
	"github.com/gorilla/mux"
)

var db *sql.DB
var err error

type Jurnal struct {
	Date    string `json:"date"`
	DateGmt string `json:"date_gmt"`
	GUID    struct {
		Rendered string `json:"rendered"`
	} `json:"guid"`
	ID          int64  `json:"id"`
	Link        string `json:"link"`
	Modified    string `json:"modified"`
	ModifiedGmt string `json:"modified_gmt"`
	Slug        string `json:"slug"`
	Status      string `json:"status"`
	Title       struct {
		Rendered string `json:"rendered"`
	} `json:"title"`
	Type string `json:"type"`
}

type Scientist struct {
	Age    int64 `json:"age"`
	Errors struct {
		Detail string `json:"detail"`
		Source struct {
			Pointer string `json:"pointer"`
		} `json:"source"`
		Status string `json:"status"`
		Title  string `json:"title"`
	} `json:"errors"`
	Name   string `json:"name"`
	Powers struct {
		Task1 string `json:"Task1"`
		Task2 string `json:"Task2"`
		Task3 string `json:"Task3"`
	} `json:"powers"`
	SecretIdentity string `json:"secretIdentity"`
}

// insert for json number 1
func inssertJurnal(w http.ResponseWriter, r *http.Request) {

	body, _ := ioutil.ReadAll(r.Body)

	var jnl Jurnal

	if err = json.Unmarshal(body, &jnl); err != nil {
		fmt.Println("Failed decoding json message")
	}

	stmt, err := db.Prepare("INSERT INTO jurnal (id,date,date_gmt,website,modified,modified_gmt,slug,status,type,link,title) VALUES(?,?,?,?,?,?,?,?,?,?,?)")

	if err != nil {
		panic(err.Error())
	}

	_, err = stmt.Exec(jnl.ID, jnl.Date, jnl.DateGmt, jnl.GUID.Rendered, jnl.Link, jnl.Modified, jnl.ModifiedGmt, jnl.Slug, jnl.Status, jnl.Title.Rendered, jnl.Type)

	if err != nil {
		panic(err.Error())
	}

	fmt.Fprintf(w, "Date Created")
}

// insert for json number 2
func insertScientist(w http.ResponseWriter, r *http.Request) {

	body, _ := ioutil.ReadAll(r.Body)

	var scient Scientist

	if err = json.Unmarshal(body, &scient); err != nil {
		fmt.Println("Failed decoding json message")
	}

	stmt, err := db.Prepare("INSERT INTO scientist (name,age,secretIdentity,task1,task2,task3,status,source,title,detail) VALUES(?,?,?,?,?,?,?,?,?,?)")

	if err != nil {
		panic(err.Error())
	}

	_, err = stmt.Exec(scient.Name, scient.Age, scient.SecretIdentity, scient.Powers.Task1, scient.Powers.Task2, scient.Powers.Task3, scient.Errors.Status, scient.Errors.Source.Pointer, scient.Errors.Title, scient.Errors.Detail)

	if err != nil {
		panic(err.Error())
	}

	fmt.Fprintf(w, "Date Created")
}

func main() {

	db, err = sql.Open("mysql", "root:@tcp(127.0.0.1:3306)/taskiv")
	if err != nil {
		panic(err.Error())
	}

	defer db.Close()

	// Init router
	r := mux.NewRouter()

	fmt.Println("Server on :8181")

	// Route handles & endpoints
	r.HandleFunc("/journals", inssertJurnal).Methods("POST")
	r.HandleFunc("/scientist", insertScientist).Methods("POST")

	// Start server
	log.Fatal(http.ListenAndServe(":8181", r))

}
