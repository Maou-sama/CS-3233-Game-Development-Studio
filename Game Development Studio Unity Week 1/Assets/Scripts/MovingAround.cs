using System.Collections;
using System.Collections.Generic;
using UnityEngine.SceneManagement;
using UnityEngine;
using UnityEngine.AI;

public class MovingAround : MonoBehaviour
{
    //Variables
    private Vector3 startPosition;
    private Vector3 finalPosition;
    public int roamRadius = 10;
    public Transform playerPosition;
    NavMeshAgent nma;

    public bool roaming;
    public bool chasing;

    private void Awake()
    {
        //Set the start position to this object position when the script is awake
        startPosition = transform.position;
    }

    private void Start()
    {
        roaming = true;
        chasing = false;
        //Get the Nav Mesh Agent component for auto navigating
        nma = GetComponent<NavMeshAgent>();
    }

    private void Update()
    {
        //if roaming is true invoke FreeRoam then turn off roaming to avoid invoking every frame
        if (roaming)
        {
            FreeRoam();
            roaming = false;
        }

        //if chasing is true invoke chase player
        if (chasing)
        {
            ChasePlayer(playerPosition.position);
        }

        //when the object roam to the final position start roaming again
        if(transform.position == finalPosition)
        {
            roaming = true;
        }
    }

    void FreeRoam()
    {
        //The function will choose a random position inside the roam radius and use nav mesh agent to navigate there
        Vector3 randomDirection = Random.insideUnitSphere * roamRadius;
        randomDirection += startPosition;
        NavMeshHit hit;
        NavMesh.SamplePosition(randomDirection, out hit, roamRadius, 1);
        finalPosition = hit.position;
        nma.destination = finalPosition;
    }

    //the nav mesh agent will auto chase the player when this function is called
    void ChasePlayer(Vector3 playerPos)
    {
        nma.destination = playerPos;
    }
}