package main

import (
	"database/sql"
	"encoding/xml"
	"fmt"
	"io/ioutil"
	"log"
	"net/http"

	_ "github.com/go-sql-driver/mysql"
	"github.com/gorilla/mux"
)

var db *sql.DB
var err error

type Root struct {
	XMLName   xml.Name `xml:"Root"`
	Text      string   `xml:",chardata"`
	Xmlns     string   `xml:"xmlns,attr"`
	Customers struct {
		Text     string `xml:",chardata"`
		Customer []struct {
			Text         string `xml:",chardata"`
			CustomerID   string `xml:"CustomerID,attr"`
			CompanyName  string `xml:"CompanyName"`
			ContactName  string `xml:"ContactName"`
			ContactTitle string `xml:"ContactTitle"`
			Phone        string `xml:"Phone"`
			FullAddress  struct {
				Text       string `xml:",chardata"`
				Address    string `xml:"Address"`
				City       string `xml:"City"`
				Region     string `xml:"Region"`
				PostalCode string `xml:"PostalCode"`
				Country    string `xml:"Country"`
			} `xml:"FullAddress"`
			Fax string `xml:"Fax"`
		} `xml:"Customer"`
	} `xml:"Customers"`
	Orders struct {
		Text  string `xml:",chardata"`
		Order []struct {
			Text         string `xml:",chardata"`
			CustomerID   string `xml:"CustomerID"`
			EmployeeID   string `xml:"EmployeeID"`
			OrderDate    string `xml:"OrderDate"`
			RequiredDate string `xml:"RequiredDate"`
			ShipInfo     struct {
				Text           string `xml:",chardata"`
				ShippedDate    string `xml:"ShippedDate,attr"`
				ShipVia        string `xml:"ShipVia"`
				Freight        string `xml:"Freight"`
				ShipName       string `xml:"ShipName"`
				ShipAddress    string `xml:"ShipAddress"`
				ShipCity       string `xml:"ShipCity"`
				ShipRegion     string `xml:"ShipRegion"`
				ShipPostalCode string `xml:"ShipPostalCode"`
				ShipCountry    string `xml:"ShipCountry"`
			} `xml:"ShipInfo"`
		} `xml:"Order"`
	} `xml:"Orders"`
}

func getCustomers(w http.ResponseWriter, r *http.Request) {

	body, _ := ioutil.ReadAll(r.Body)

	var request Root

	if err = xml.Unmarshal(body, &request); err != nil {
		fmt.Println("Failed decoding json message")
	}

	for i := 0; i < len(request.Customers.Customer); i++ {

		fmt.Fprintln(w, "Customer ID: "+request.Customers.Customer[i].CustomerID)
		fmt.Fprintln(w, "Company Name : "+request.Customers.Customer[i].CompanyName)
	}
	//Tugas insert kan ke table Customer
	for j := 0; j < len(request.Customers.Customer); j++ {
		stmt, err := db.Prepare("INSERT INTO customers (CustomerID,CompanyName,ContactName,ContactTitle,Address,City,Region,Country,Phone,PostalCode,Fax) VALUES(?,?,?,?,?,?,?,?,?,?,?)")

		if err != nil {
			panic(err.Error())
		}

		_, err = stmt.Exec(request.Customers.Customer[j].CustomerID, request.Customers.Customer[j].CompanyName, request.Customers.Customer[j].ContactName, request.Customers.Customer[j].ContactTitle, request.Customers.Customer[j].Phone, request.Customers.Customer[j].Fax, request.Customers.Customer[j].FullAddress.Address, request.Customers.Customer[j].FullAddress.City, request.Customers.Customer[j].FullAddress.Country, request.Customers.Customer[j].FullAddress.PostalCode, request.Customers.Customer[j].FullAddress.Region)

		if err != nil {
			panic(err.Error())
		}

		fmt.Fprintf(w, "Date Created")
	}

	//Tugas insert kan ke table Order
	for ord := 0; ord < len(request.Orders.Order); ord++ {
		stmt, err := db.Prepare("INSERT INTO orders (CustomerID,EmployeeID,OrderDate,RequiredDate,ShippedDate,ShipVia,Freight,ShipName,ShipAddress,ShipCity,ShipRegion,ShipPostalCode,ShipCountry) VALUES(?,?,?,?,?,?,?,?,?,?,?,?,?)")

		if err != nil {
			panic(err.Error())
		}

		_, err = stmt.Exec(request.Orders.Order[ord].CustomerID, request.Orders.Order[ord].EmployeeID, request.Orders.Order[ord].OrderDate, request.Orders.Order[ord].RequiredDate, request.Orders.Order[ord].ShipInfo.Freight, request.Orders.Order[ord].ShipInfo.ShipAddress, request.Orders.Order[ord].ShipInfo.ShipCity, request.Orders.Order[ord].ShipInfo.ShipCountry, request.Orders.Order[ord].ShipInfo.ShipName, request.Orders.Order[ord].ShipInfo.ShipPostalCode, request.Orders.Order[ord].ShipInfo.ShipRegion, request.Orders.Order[ord].ShipInfo.ShipVia, request.Orders.Order[ord].ShipInfo.ShippedDate)

		if err != nil {
			panic(err.Error())
		}

		fmt.Fprintf(w, "Date Created")
	}
}

func main() {

	db, err = sql.Open("mysql", "root:@tcp(127.0.0.1:3306)/northwind")
	if err != nil {
		panic(err.Error())
	}

	defer db.Close()

	// Init router
	r := mux.NewRouter()

	fmt.Println("Server on :8181")

	// Route handles & endpoints
	r.HandleFunc("/customers", getCustomers).Methods("POST")

	// Start server
	log.Fatal(http.ListenAndServe(":8181", r))

}
