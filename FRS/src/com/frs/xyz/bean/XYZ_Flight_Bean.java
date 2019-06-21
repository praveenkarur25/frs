package com.frs.xyz.bean;

public class XYZ_Flight_Bean {

	String flight_Name;
	String flight_From;
	String flight_To;
	String flight_via;
	String arr_Time;
	String dept_Time;
	String flight_class;
	String flightid;
	String days[];
	int fare;

	public int getFare() {
		return fare;
	}

	public void setFare(int fare) {
		this.fare = fare;
	}

	public String[] getDays() {
		return days;
	}

	public void setDays(String[] days) {
		this.days = days;
	}

	int economy_fare;
	int business_fare;
	int firstclass_fare;

	public String getFlightid() {
		return flightid;
	}

	public void setFlightid(String flightid) {
		this.flightid = flightid;
	}

	public String getFlight_Name() {
		return flight_Name;
	}

	public void setFlight_Name(String flight_Name) {
		this.flight_Name = flight_Name;
	}

	public String getFlight_From() {
		return flight_From;
	}

	public void setFlight_From(String flight_From) {
		this.flight_From = flight_From;
	}

	public String getFlight_To() {
		return flight_To;
	}

	public void setFlight_To(String flight_To) {
		this.flight_To = flight_To;
	}

	public String getFlight_via() {
		return flight_via;
	}

	public void setFlight_via(String flight_via) {
		this.flight_via = flight_via;
	}

	public String getArr_Time() {
		return arr_Time;
	}

	public void setArr_Time(String arr_Time) {
		this.arr_Time = arr_Time;
	}

	public String getDept_Time() {
		return dept_Time;
	}

	public void setDept_Time(String dept_Time) {
		this.dept_Time = dept_Time;
	}

	public int getEconomy_fare() {
		return economy_fare;
	}

	public void setEconomy_fare(int economy_fare) {
		this.economy_fare = economy_fare;
	}

	public int getBusiness_fare() {
		return business_fare;
	}

	public void setBusiness_fare(int business_fare) {
		this.business_fare = business_fare;
	}

	public int getFirstclass_fare() {
		return firstclass_fare;
	}

	public void setFirstclass_fare(int firstclass_fare) {
		this.firstclass_fare = firstclass_fare;
	}

	public String getFlight_class() {
		return flight_class;
	}

	public void setFlight_class(String flight_class) {
		this.flight_class = flight_class;
	}

}
