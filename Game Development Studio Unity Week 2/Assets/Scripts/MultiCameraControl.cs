using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class MultiCameraControl : MonoBehaviour {

    [Header("Camera Array")]
    public Camera[] cams;
    [Header("My active camera")]
    public int activeCamera = 0;

	// Use this for initialization
	void Start () {
		for(int i = 0; i < cams.Length; i++)
        {
            if(i == activeCamera)
            {
                cams[i].enabled = true;
            }

            else
            {
                cams[i].enabled = false;
            }
        }
	}
	
	// Update is called once per frame
	void Update () {
        /*if (Input.GetKeyDown(KeyCode.Space))
        {
            DeactivateAllCam();

            activeCamera++;

            if(activeCamera > 3)
            {
                activeCamera = 0;
            }

            cams[activeCamera].enabled = true;
        }*/
	}

    public void DeactivateAllCam()
    {
        for(int i = 0; i < cams.Length; i++)
        {
            cams[i].enabled = false;
        }
    }
}
