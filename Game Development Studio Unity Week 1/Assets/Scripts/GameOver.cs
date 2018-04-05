using UnityEngine;
using UnityEngine.SceneManagement;
using System.Collections;

public class GameOver : MonoBehaviour
{
    private AudioSource audioSource;
    // Use this for initialization
    void Start()
    {
        //Get the audio source and play the music
        audioSource = GetComponent<AudioSource>();
        audioSource.Play();
    }

    // Update is called once per frame
    void Update()
    {
        //After music ends aka when credits finish rolling the game will go to main menu
        if (!audioSource.isPlaying)
        {
            SceneManager.LoadSceneAsync("MainMenu");
        }
    }
}
