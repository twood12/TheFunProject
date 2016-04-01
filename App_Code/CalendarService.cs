using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Web.Services;

/// <summary>
/// Summary description for CalendarService
/// </summary>
[WebService(Namespace = "http://tempuri.org/")]
[WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
// To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line.
[System.Web.Script.Services.ScriptService]
public class CalendarService : System.Web.Services.WebService
{
    public CalendarService()
    {
        //Uncomment the following line if using designed components
        //InitializeComponent();
    }

    [System.Web.Services.WebMethod]
    public List<Event> getEventList()
    {
        SqlDataReader reader;
        List<Event> eventList = new List<Event>();
        string cs = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;
        SqlConnection sc = new SqlConnection(cs);
        SqlCommand cmd = new SqlCommand();
        cmd.Connection = sc;
        cmd.CommandText = "getAllEvents";
        cmd.CommandType = System.Data.CommandType.StoredProcedure;
        sc.Open();
        reader = cmd.ExecuteReader();

        if (reader.HasRows)
        {
            while (reader.Read())
            {
                eventList.Add(new Event()
                {
                    eventTitle = reader["EventName"].ToString(),
                    eventStartDate = reader["EventStartDate"].ToString(),
                    eventEndDate = reader["EventEndDate"].ToString(),
                    eventDescription = reader["EventDescription"].ToString(),
                    eventID = Int32.Parse(reader["EventID"].ToString()),
                    eventTopic = reader["EventTopic"].ToString(),
                    eventPlaceID = reader["EventPlaceID"].ToString()
                });
            }
        }

        string json = JsonConvert.SerializeObject(eventList);
        //return json;
        return eventList;
    }

    [WebMethod]
    public bool updateEvent(Event eventData)
    {
        List<Event> eventList = new List<Event>();
        SqlDataReader reader;
        string cs = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;
        SqlConnection sc = new SqlConnection(cs);
        SqlCommand cmd = new SqlCommand();
        cmd.Connection = sc;
        cmd.CommandText = "getEvent";
        cmd.CommandType = System.Data.CommandType.StoredProcedure;
        cmd.Parameters.AddWithValue("@EventID", eventData.eventID);
        sc.Open();
        reader = cmd.ExecuteReader();
        if (reader.HasRows)
        {
            sc.Close();
            SqlCommand cmdUpdate = new SqlCommand("updateEvent", sc);
            cmdUpdate.CommandType = System.Data.CommandType.StoredProcedure;
            cmdUpdate.Parameters.AddWithValue("@EventID", eventData.eventID);
            cmdUpdate.Parameters.AddWithValue("@EventName", eventData.eventTitle);
            cmdUpdate.Parameters.AddWithValue("@EventStartDate", eventData.eventStartDate);
            cmdUpdate.Parameters.AddWithValue("@EventTopic", eventData.eventTopic);
            cmdUpdate.Parameters.AddWithValue("@EventEndDate", eventData.eventEndDate);
            cmdUpdate.Parameters.AddWithValue("@EventDescription", eventData.eventDescription);
            sc.Open();
            cmdUpdate.ExecuteNonQuery();
            sc.Close();
        }
        else
        {
            sc.Close();
            SqlCommand cmdInsert = new SqlCommand("insertEvent", sc);
            cmdInsert.CommandType = System.Data.CommandType.StoredProcedure;
            cmdInsert.Parameters.AddWithValue("@EventName", eventData.eventTitle);
            cmdInsert.Parameters.AddWithValue("@EventStartDate", eventData.eventStartDate);
            cmdInsert.Parameters.AddWithValue("@EventTopic", eventData.eventTopic);
            cmdInsert.Parameters.AddWithValue("@EventEndDate", eventData.eventEndDate);
            cmdInsert.Parameters.AddWithValue("@EventDescription", eventData.eventDescription);
            cmdInsert.Parameters.AddWithValue("@EventPlaceID", eventData.eventPlaceID);
            sc.Open();
            cmdInsert.ExecuteNonQuery();
            sc.Close();
        }
        return true;
    }

    [WebMethod]
    public bool deleteEvent(Event eventData)
    {
        string cs = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;
        SqlConnection sc = new SqlConnection(cs);
        SqlCommand cmd = new SqlCommand();
        cmd.Connection = sc;
        cmd.CommandText = "deleteEvent";
        cmd.CommandType = System.Data.CommandType.StoredProcedure;
        cmd.Parameters.AddWithValue("@EventID", eventData.eventID);
        sc.Open();
        cmd.ExecuteNonQuery();
        sc.Close();

        return true;
    }


    [WebMethod]
    public int getMaxEventID()
    {
        string cs = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;
        SqlConnection sc = new SqlConnection(cs);
        SqlCommand cmd = new SqlCommand();
        cmd.Connection = sc;
        cmd.CommandText = "select max(EventID) from Event";
        cmd.CommandType = System.Data.CommandType.Text;
        SqlDataReader reader;
        sc.Open();
        int max = Convert.ToInt32(cmd.ExecuteScalar());


        

        return max + 1;
    }

    public static bool dateFormatCheck(string date)
    {
        /*
        this method is used to ensure all dates are inputed correctly
        it is also called before any other date validator
        to prevent multiple errors being triggered at once
        */
        DateTime testDate;
        //bool valid = DateTime.TryParseExact(date, "MM/dd/yyyy", System.Globalization.CultureInfo.InvariantCulture, System.Globalization.DateTimeStyles.None, out testDate);
        bool valid = DateTime.TryParse(date, System.Globalization.CultureInfo.InvariantCulture, System.Globalization.DateTimeStyles.None, out testDate);
        return valid;
    }

    public static DateTime toDate(string date) // converts all txt fields to a datetime
    {
        DateTime newDate = new DateTime();
        if (dateFormatCheck(date))
        {
            newDate = DateTime.Parse(date, System.Globalization.CultureInfo.InvariantCulture, System.Globalization.DateTimeStyles.None);
            //newDate = DateTime.ParseExact(date, "MM/dd/yyyy", System.Globalization.CultureInfo.InvariantCulture, System.Globalization.DateTimeStyles.None);
            return newDate;
        }
        else
            return newDate;
    }

    public static string formatDateFromDB(DateTime date) // drops the time when reading from the DB
    {
        string formatedDate = "";
        try
        {
            if (date.ToString().Length == 20)
                formatedDate = date.ToString().Substring(0, 8);
            if (date.ToString().Length == 21)
                formatedDate = date.ToString().Substring(0, 9);
            if (date.ToString().Length == 22)
                formatedDate = date.ToString().Substring(0, 10);
            if (formatedDate.Equals("1/1/1900"))
                formatedDate = "";
        }
        catch (Exception)
        {
            throw;
        }
        return formatedDate;
    }
}