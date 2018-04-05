using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.SceneManagement;

public class Player: MonoBehaviour {

    //Variables
    CharacterController cc;
    Animator ani;
    public float moveSpeed = 1.0f;
    public float cameraSpeed = 5.0f;
    public float jumpHeight = 0.1f;
    private Vector3 direction = new Vector3(0, 0, 0);
    public bool run;
    private float turnSpeed;
    private float turnSpeedY;
    private float zoomSpeed;

    public bool seeUnity = false;
    public bool seeYuko = false;

	// Use this for initialization
	void Start () {
        cc = GetComponent<CharacterController>();
        ani = GetComponent<Animator>();
        run = false;
	}
	
	// Update is called once per frame
	void Update () {
        //Movement direction based on key pressed defined in horizontal, vertical, jump axis
        direction = new Vector3(Input.GetAxis("Horizontal"), Input.GetAxis("Jump"), Input.GetAxis("Vertical"));

        //Make the player run if left shift is pressed
        if (Input.GetKey(KeyCode.LeftShift))
        {
            run = true;
        }

        else
        {
            run = false;
        }

        //set the animator to run if run variable is true and multiply all movement direction except jump by 2 effectively double the speed
        if (run)
        {
            ani.SetBool("run", true);
            direction = new Vector3(direction.x * 2, direction.y, direction.z * 2);
        }

        else
        {
            ani.SetBool("run", false);
        }

        //Change animator based on the x and z input
        ani.SetFloat("x", direction.x);
        ani.SetFloat("z", direction.z);

        //move character based on direction pressed
        direction = transform.TransformDirection(new Vector3(direction.x * moveSpeed, direction.y * jumpHeight, direction.z * moveSpeed));
        cc.Move(direction);


        //Camera Movement
        turnSpeed = Input.GetAxis("Mouse X");
        turnSpeedY = Input.GetAxis("Mouse Y");
        zoomSpeed = Input.GetAxis("Mouse ScrollWheel");

        //Camera and player will rotate and zoom (camera only) based on mouse input
        transform.RotateAround(transform.position, transform.up, turnSpeed * cameraSpeed);
        Camera.main.transform.RotateAround(transform.position, transform.right, turnSpeedY);
        Camera.main.transform.Translate(new Vector3 (0, 0, zoomSpeed));
        
	}

    private void OnTriggerEnter(Collider other)
    {
        //if player get in the range of the door detection the door will open
        //lean tween is used for bouncy movement of the door
        if (other.name == "DoorDetect")
        {
            GameObject door = GameObject.Find("DoorHinge");
            LeanTween.rotateAround(door, door.transform.up, -90.0f, 1.0f).setEaseOutBounce();
        }

        //if player enter within range of enemy change the chasing and roaming variables and set the player position accordingly
        if (other.gameObject.tag == "Enemy")
        {
            other.gameObject.GetComponent<MovingAround>().chasing = true;
            other.gameObject.GetComponent<MovingAround>().roaming = false;
            other.gameObject.GetComponent<MovingAround>().playerPosition = transform;
        }

        //Mark the variables according to who the player see (get in the range of detection)
        if(other.gameObject.tag == "Yuko")
        {
            seeYuko = true;
        }

        if (other.gameObject.tag == "Unity")
        {
            seeUnity = true;
        }

        //If player get to finish object and see both event then load game over
        if (other.gameObject.tag == "Finish")
        {
            if(seeYuko && seeUnity)
            {
                SceneManager.LoadSceneAsync("GameOver");
            }
        }
    }

    private void OnTriggerExit(Collider other)
    {
        //door close when leave the detector
        if (other.name == "DoorDetect")
        {
            GameObject door = GameObject.Find("DoorHinge");
            LeanTween.rotateAround(door, door.transform.up, 90.0f, 1.0f).setEaseOutBounce();
        }

        //enemy will go back to roaming after player leave the range of detection
        if (other.gameObject.tag == "Enemy")
        {
            other.gameObject.GetComponent<MovingAround>().chasing = false;
            other.gameObject.GetComponent<MovingAround>().roaming = true;
        }
    }

    private void OnCollisionEnter(Collision collision)
    {
        //If player collide with enemy the game ends
        if (collision.gameObject.tag == "Enemy")
        {
            SceneManager.LoadSceneAsync("GameOver");
        }
    }
}
