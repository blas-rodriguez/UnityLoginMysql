using MySql.Data.MySqlClient;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using UnityEngine;
using UnityEngine.SceneManagement;
using UnityEngine.UI;

public class logtest : MonoBehaviour
{
    public InputField userNameInput;
    public InputField passwordInput;
    public GameObject failUI;
    public GameObject loseUI;
    private AsyncOperation async;
    [HideInInspector] public static int count = 0;

    // Start is called before the first frame update
    void Start()
    {

    }
    public void OnClickedButton()
    {

        Login(new string[] { userNameInput.text, passwordInput.text });
    }

    // Update is called once per frame

    private void Login(string[] str)
    {
        Dictionary<string, string> myDic = new Dictionary<string, string>();
        myDic.Clear();
        string connStr = "Database=sislab;datasource=192.168.1.18;port=3306;user=blas2;pwd=larioja12345;";
        MySqlConnection conn = new MySqlConnection(connStr);
        if(conn.State == ConnectionState.Open)
        {
             Debug.Log("Database connection is successful");           
        }
        else
        {
            Debug.Log("Database connection failed");
            
        }
        conn.Open();
        // #region 查询
        #region Inquire
         MySqlCommand cmd = new MySqlCommand("select * from users", conn);
        MySqlDataReader reader = cmd.ExecuteReader();
        while (reader.Read())
        {
            string username = reader.GetString("name");
            string password = reader.GetString("password");
            myDic.Add(username, password);
        }
        if (myDic.ContainsKey(str[0]))
        {
            Debug.Log("Account exists!");
            string vale;
            // if (myDic.TryGetValue(str[0], out vale))
            {
                // if (vale == str[1])
                {
                    Debug.Log("login successful!");
                    PlayerPrefs.SetString("username", userNameInput.text);
                    Debug.Log(PlayerPrefs.GetString("username"));
                    //Judge whether the jump is successful and the number of records, if you don’t need it, you can use it directly without writing the following SceneManager.loadlevel To jump
                    async = SceneManager.LoadSceneAsync("LevelMenu");
                    if (async.isDone)
                    {
                        count++;
                    }
                    PlayerPrefs.SetInt("menuload", count);
                    Debug.Log(PlayerPrefs.GetInt("menuload"));
                }
                // else
                // {

                //     Debug.Log("Wrong password, please re-enter!");
                //     failUI.SetActive(true);
                // }
            }
        }
        else
        {
            Debug.Log("Account does not exist!");
            loseUI.SetActive(true);
        }
        #endregion
        reader.Close();//Close reading
        conn.Close();//Close the connection to the database
    }
}