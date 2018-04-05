using UnityEngine;
using System.Collections;

public class DoorButtonControl : MonoBehaviour
{

    public Transform door;

    private void OnCollisionEnter(Collision collision)
    {
        GetComponent<Rigidbody>().isKinematic = false;
        door.GetComponent<Rigidbody>().velocity = door.transform.up;
    }
}
