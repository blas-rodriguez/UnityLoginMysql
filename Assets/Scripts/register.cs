
using MySql.Data.MySqlClient;
using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;
using System.Data;

public class register : MonoBehaviour
{
    // Start is called before the first frame update
    public InputField userNameInput;
    public InputField passwordInput;
    public GameObject sueccedUI;
    public GameObject failUI;
    void Start()
    {

    }

    public void OnClickedButton()
    {

        Register(new string[] { userNameInput.text, passwordInput.text });
    }

    private void Register(string[] strRegister)
    {
        string connStr = "Database=sislab;datasource=192.168.1.18;port=3306;user=blas2;pwd=larioja12345;";
        MySqlConnection conn = new MySqlConnection(connStr);
        if (conn.State == ConnectionState.Open)
        {
            Debug.Log("Database connection is successful");
        }
        else
        {
            Debug.Log("Database connection failed");
        }
        conn.Open();
        //First, check whether there is any duplicate data in the current database.
        MySqlCommand myCommand = new MySqlCommand("select*from user", conn);
        MySqlDataReader reader = myCommand.ExecuteReader();
        List<string> user = new List<string>();
        while (reader.Read())
        {
            string username = reader.GetString("name");
            string password = reader.GetString("password");
            user.Add(username);
        }
        //**Avoid duplication of accounts.**
        foreach (var item in user)
        {
            if (user.Contains(strRegister[0]))
            {
                Debug.Log("Account already exists!");
                failUI.SetActive(true);//This is my prompt interface
                break;
            }
            else
            {
                reader.Close();//**Turn off the query function first.**
                MySqlCommand cmd = new MySqlCommand("insert into users set name ='" + strRegister[0] + "'" + ",password='" + strRegister[1] + "'", conn);
                cmd.Parameters.AddWithValue("name", strRegister[0]);
                cmd.Parameters.AddWithValue("password", strRegister[1]);
                cmd.ExecuteNonQuery();
                Debug.Log("registration success!");
                sueccedUI.SetActive(true);//It is also a prompt interface
                break;
            }
        }
    }
}