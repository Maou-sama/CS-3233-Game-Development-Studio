using UnityEngine;
using UnityEngine.UI;
using UnityEngine.SceneManagement;
using System.Collections;

public class MainMenu : MonoBehaviour
{
    private Button thisButton;
    // Use this for initialization
    void Start()
    {
        //Get the button components
        thisButton = GetComponent<Button>();
    }

    // Update is called once per frame
    void Update()
    {
        //Add listener to the button this script is assigned to
        thisButton.onClick.AddListener(ButtonStuff);
    }

    void ButtonStuff()
    {
        //If the button is start game the go to the main game scene
        if(thisButton.name == "Start Game")
        {
            SceneManager.LoadScene("MainGame");
        }

        //If button is exit then quit the application (only works on standalone build)
        else if(thisButton.name == "Exit")
        {
            Application.Quit();
        }
    }
}
