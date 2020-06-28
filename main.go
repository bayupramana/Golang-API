package main

import (
	"database/sql"
	"encoding/json"
	"fmt"
	"log"
	"net/http"

	_ "github.com/go-sql-driver/mysql"
	"github.com/gorilla/mux"
)

var db *sql.DB
var err error

type Mtrips struct {
	TripID           string `json:"TripID"`
	TravelType       string `json:"TravelType"`
	TravelID         string `json:"TravelID"`
	Description      string `json:"Description"`
	DepartureDate    string `json:"DepartureDate"`
	ReturnDate       string `json:"ReturnDate"`
	Duration         string `json:"Duration"`
	Origin           string `json:"Origin"`
	Destination      string `json:"Destination"`
	Transit          string `json:"Transit"`
	DetailTransit    string `json:"DetailTransit"`
	HotelName        string `json:"HotelName"`
	HotelRating      string `json:"HotelRating"`
	DetailHotel      string `json:"Detail Hotel"`
	Currency         string `json:"Currency"`
	Price            string `json:"Price"`
	PromoCode        string `json:"PromoCode"`
	PromoDescription string `json:"PromoDescription"`
	AirlinesID       string `json:"AirlinesID"`
	Goods            string `json:"Goods"`
	TermCondition    string `json:"TermCondition"`
	Triptype         string `json:"TripType"`
	Quota            string `json:"Quota"`
	TripStatus       string `json:"TripStatus"`
	StatusID         string `json:"StatusID"`
	Lat              string `json:"Lat"`
	Long             string `json:"Longitude"`
	DoubleType       string `json:"DoubleType"`
	Tripletype       string `json:"TripleType"`
	QuadType         string `json:"QuadType"`
	PromoStatus      string `json:"PromoStatus"`
}

func insertTrips(w http.ResponseWriter, r *http.Request) {

	if r.Method == "POST" {

		TripID := r.FormValue("tripID")
		TravelType := r.FormValue("travelType")
		TravelID := r.FormValue("travelID")
		Description := r.FormValue("description")
		DepartureDate := r.FormValue("departureDate")
		ReturnDate := r.FormValue("returnDate")
		Duration := r.FormValue("duration")
		Origin := r.FormValue("origin")
		Destination := r.FormValue("destination")
		Transit := r.FormValue("transit")
		DetailTransit := r.FormValue("detailTransit")
		HotelName := r.FormValue("hotelName")
		HotelRating := r.FormValue("hotelRating")
		DetailHotel := r.FormValue("detailHotel")
		Currency := r.FormValue("currency")
		Price := r.FormValue("price")
		PromoCode := r.FormValue("promoCode")
		PromoDescription := r.FormValue("promoDescription")
		AirlinesID := r.FormValue("airlinesID")
		Goods := r.FormValue("goods")
		TermCondition := r.FormValue("termCondition")
		Triptype := r.FormValue("tripType")
		Quota := r.FormValue("quota")
		TripStatus := r.FormValue("tripStatus")
		StatusID := r.FormValue("statusID")
		Lat := r.FormValue("lat")
		Long := r.FormValue("long")
		DoubleType := r.FormValue("doubleType")
		Tripletype := r.FormValue("tripleType")
		QuadType := r.FormValue("quadType")
		PromoStatus := r.FormValue("promoStatus")

		stmt, err := db.Prepare("INSERT INTO m_trips (TripID,TravelType,TravelID,Description,DepartureDate,ReturnDate,Duration,Origin,Destination,Transit,DetailTransit,HotelName,HotelRating,DetailHotel,Currency,Price,PromoCode,PromoDescription,AirlinesID,Goods,TermCondition,TripType,Quota,TripStatus,StatusID,Lat,Longitude,DoubleType,TripleType,QuadType,PromoStatus) VALUES(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)")

		if err != nil {
			panic(err.Error())
		}

		_, err = stmt.Exec(TripID, TravelType, TravelID, Description, DepartureDate, ReturnDate, Duration, Origin, Destination, Transit, DetailTransit, HotelName, HotelRating, DetailHotel, Currency, Price, PromoCode, PromoDescription, AirlinesID, Goods, TermCondition, Triptype, Quota, TripStatus, StatusID, Lat, Long, DoubleType, Tripletype, QuadType, PromoStatus)

		if err != nil {
			panic(err.Error())
		}

		fmt.Fprintf(w, "Date Created")
		//http.Redirect(w, r, "/", 301)
	}
}

func getTrips(w http.ResponseWriter, r *http.Request) {
	w.Header().Set("Content-Type", "application/json")

	var trips []Mtrips

	sql := `SELECT
				TripID,
				IFNULL(TravelType,''),
				IFNULL(TravelID,'') TravelID,
				IFNULL(Description,'') Description,
				IFNULL(DepartureDate,'') DepartureDate,
				IFNULL(ReturnDate,'') ReturnDate,
				IFNULL(Duration,'') Duration,
				IFNULL(Origin,'') Origin,
				IFNULL(Destination,'') Destination ,
				IFNULL(Transit,'') Transit,
				IFNULL(DetailTransit,'') DetailTransit,
				IFNULL(HotelName,'') HotelName,
				IFNULL(HotelRating,'') HotelRating,
				IFNULL(DetailHotel,'') DetailHotel,
				IFNULL(Currency,'') Currency,
				IFNULL(Price,'') Price ,
				IFNULL(PromoCode,'') PromoCode,
				IFNULL(PromoDescription,'') PromoDescription,
				IFNULL(AirlinesID,'') AirlinesID,
				IFNULL(Goods,'') Goods,
				IFNULL(TermCondition,'') TermCondition,
				IFNULL(TripType,'') TripType,
				IFNULL(Quota,'') Quota,
				IFNULL(TripStatus,'') TripStatus ,
				IFNULL(StatusID,'') StatusID,
				IFNULL(Lat,'') Lat,
				IFNULL(Longitude,'') Longitude,
				IFNULL(DoubleType,'') DoubleType,
				IFNULL(TripleType,'') TripleType,
				IFNULL(QuadType,'') QuadType,
				IFNULL(PromoStatus,'') PromoStatus
			FROM m_trips`

	result, err := db.Query(sql)

	defer result.Close()

	if err != nil {
		panic(err.Error())
	}

	for result.Next() {

		var trip Mtrips
		err := result.Scan(&trip.TripID, &trip.TravelType, &trip.TravelID, &trip.Description, &trip.DepartureDate, &trip.ReturnDate, &trip.Duration,
			&trip.Origin, &trip.Destination, &trip.Transit, &trip.DetailTransit, &trip.HotelName, &trip.HotelRating, &trip.DetailHotel, &trip.Currency,
			&trip.Price, &trip.PromoCode, &trip.PromoDescription, &trip.AirlinesID, &trip.Goods, &trip.TermCondition, &trip.Triptype, &trip.Quota,
			&trip.TripStatus, &trip.StatusID, &trip.Lat, &trip.Long, &trip.DoubleType, &trip.Tripletype, &trip.QuadType, &trip.PromoStatus)

		if err != nil {
			panic(err.Error())
		}
		trips = append(trips, trip)
	}

	json.NewEncoder(w).Encode(trips)
}

func getTripByID(w http.ResponseWriter, r *http.Request) {
	w.Header().Set("Content-Type", "application/json")
	var trips []Mtrips
	params := mux.Vars(r)

	sql := `SELECT
					TripID,
					IFNULL(TravelType,''),
					IFNULL(TravelID,'') TravelID,
					IFNULL(Description,'') Description,
					IFNULL(DepartureDate,'') DepartureDate,
					IFNULL(ReturnDate,'') ReturnDate,
					IFNULL(Duration,'') Duration,
					IFNULL(Origin,'') Origin,
					IFNULL(Destination,'') Destination ,
					IFNULL(Transit,'') Transit,
					IFNULL(DetailTransit,'') DetailTransit,
					IFNULL(HotelName,'') HotelName,
					IFNULL(HotelRating,'') HotelRating,
					IFNULL(DetailHotel,'') DetailHotel,
					IFNULL(Currency,'') Currency,
					IFNULL(Price,'') Price ,
					IFNULL(PromoCode,'') PromoCode,
					IFNULL(PromoDescription,'') PromoDescription,
					IFNULL(AirlinesID,'') AirlinesID,
					IFNULL(Goods,'') Goods,
					IFNULL(TermCondition,'') TermCondition,
					IFNULL(TripType,'') TripType,
					IFNULL(Quota,'') Quota,
					IFNULL(TripStatus,'') TripStatus ,
					IFNULL(StatusID,'') StatusID,
					IFNULL(Lat,'') Lat,
					IFNULL(Longitude,'') Longitude,
					IFNULL(DoubleType,'') DoubleType,
					IFNULL(TripleType,'') TripleType,
					IFNULL(QuadType,'') QuadType,
					IFNULL(PromoStatus,'') PromoStatus
				FROM m_trips WHERE TripID=?`

	result, err := db.Query(sql, params["id"])

	if err != nil {
		panic(err.Error())
	}

	defer result.Close()

	var trip Mtrips

	for result.Next() {

		err := result.Scan(&trip.TripID, &trip.TravelType, &trip.TravelID, &trip.Description, &trip.DepartureDate, &trip.ReturnDate, &trip.Duration,
			&trip.Origin, &trip.Destination, &trip.Transit, &trip.DetailTransit, &trip.HotelName, &trip.HotelRating, &trip.DetailHotel, &trip.Currency,
			&trip.Price, &trip.PromoCode, &trip.PromoDescription, &trip.AirlinesID, &trip.Goods, &trip.TermCondition, &trip.Triptype, &trip.Quota,
			&trip.TripStatus, &trip.StatusID, &trip.Lat, &trip.Long, &trip.DoubleType, &trip.Tripletype, &trip.QuadType, &trip.PromoStatus)

		if err != nil {
			panic(err.Error())
		}

		trips = append(trips, trip)
	}

	json.NewEncoder(w).Encode(trips)
}

func getPost(w http.ResponseWriter, r *http.Request) {

	w.Header().Set("Content-Type", "application/json")

	var trips []Mtrips

	TripID := r.FormValue("tripID")
	Destination := r.FormValue("destination")

	sql := `SELECT
				TripID,
				IFNULL(TravelType,''),
				IFNULL(TravelID,'') TravelID,
				IFNULL(Description,'') Description,
				IFNULL(DepartureDate,'') DepartureDate,
				IFNULL(ReturnDate,'') ReturnDate,
				IFNULL(Duration,'') Duration,
				IFNULL(Origin,'') Origin,
				IFNULL(Destination,'') Destination ,
				IFNULL(Transit,'') Transit,
				IFNULL(DetailTransit,'') DetailTransit,
				IFNULL(HotelName,'') HotelName,
				IFNULL(HotelRating,'') HotelRating,
				IFNULL(DetailHotel,'') DetailHotel,
				IFNULL(Currency,'') Currency,
				IFNULL(Price,'') Price ,
				IFNULL(PromoCode,'') PromoCode,
				IFNULL(PromoDescription,'') PromoDescription,
				IFNULL(AirlinesID,'') AirlinesID,
				IFNULL(Goods,'') Goods,
				IFNULL(TermCondition,'') TermCondition,
				IFNULL(TripType,'') TripType,
				IFNULL(Quota,'') Quota,
				IFNULL(TripStatus,'') TripStatus ,
				IFNULL(StatusID,'') StatusID,
				IFNULL(Lat,'') Lat,
				IFNULL(Longitude,'') Longitude,
				IFNULL(DoubleType,'') DoubleType,
				IFNULL(TripleType,'') TripleType,
				IFNULL(QuadType,'') QuadType,
				IFNULL(PromoStatus,'') PromoStatus
			FROM m_trips WHERE TripID = ? AND Destination = ?`

	result, err := db.Query(sql, TripID, Destination)

	if err != nil {
		panic(err.Error())
	}

	defer result.Close()

	var trip Mtrips

	for result.Next() {

		err := result.Scan(&trip.TripID, &trip.TravelType, &trip.TravelID, &trip.Description, &trip.DepartureDate, &trip.ReturnDate, &trip.Duration,
			&trip.Origin, &trip.Destination, &trip.Transit, &trip.DetailTransit, &trip.HotelName, &trip.HotelRating, &trip.DetailHotel, &trip.Currency,
			&trip.Price, &trip.PromoCode, &trip.PromoDescription, &trip.AirlinesID, &trip.Goods, &trip.TermCondition, &trip.Triptype, &trip.Quota,
			&trip.TripStatus, &trip.StatusID, &trip.Lat, &trip.Long, &trip.DoubleType, &trip.Tripletype, &trip.QuadType, &trip.PromoStatus)

		if err != nil {
			panic(err.Error())
		}

		trips = append(trips, trip)
	}

	json.NewEncoder(w).Encode(trips)

}

func updateTrips(w http.ResponseWriter, r *http.Request) {

	if r.Method == "PUT" {

		params := mux.Vars(r)

		newDescription := r.FormValue("description")
		newDepartureDate := r.FormValue("departureDate")
		newReturnDate := r.FormValue("returnDate")
		newTransit := r.FormValue("transit")
		newDetailTransit := r.FormValue("detailTransit")
		newHotelName := r.FormValue("hotelName")
		newDetailHotel := r.FormValue("detailHotel")

		stmt, err := db.Prepare("UPDATE m_trips SET Description = ?, DepartureDate = ?, ReturnDate = ?, Transit = ?, DetailTransit = ?, HotelName = ?, DetailHotel = ? WHERE TripID = ?")

		_, err = stmt.Exec(newDescription, newDepartureDate, newReturnDate, newTransit, newDetailTransit, newHotelName, newDetailHotel, params["id"])

		if err != nil {
			panic(err.Error())
		}

		fmt.Fprintf(w, "Trips with TripID = %s was updated", params["id"])
	}
}

func deleteTrips(w http.ResponseWriter, r *http.Request) {

	params := mux.Vars(r)
	stmt, err := db.Prepare("DELETE FROM m_trips WHERE TripID = ?")

	if err != nil {
		panic(err.Error())
	}
	_, err = stmt.Exec(params["id"])

	if err != nil {
		panic(err.Error())
	}

	fmt.Fprintf(w, "Trips with ID = %s was deleted", params["id"])
}

func main() {

	db, err = sql.Open("mysql", "root:@tcp(127.0.0.1:3306)/db_testing")
	if err != nil {
		panic(err.Error())
	}

	defer db.Close()
	fmt.Println("sucess runing on port 8080")

	// Init router
	r := mux.NewRouter()

	// Route handles & endpoints
	r.HandleFunc("/mtrips", getTrips).Methods("GET")
	r.HandleFunc("/mtrips/{id}", getTripByID).Methods("GET")
	r.HandleFunc("/mtrips", insertTrips).Methods("POST")
	r.HandleFunc("/mtrips/{id}", updateTrips).Methods("PUT")
	r.HandleFunc("/mtrips/{id}", deleteTrips).Methods("DELETE")
	r.HandleFunc("/mtrips/", getPost).Methods("POST", "GET")

	// Start server
	log.Fatal(http.ListenAndServe(":8080", r))
}
