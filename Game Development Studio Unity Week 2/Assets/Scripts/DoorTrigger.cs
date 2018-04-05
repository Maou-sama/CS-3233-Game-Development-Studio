using UnityEngine;
using System.Collections;

public class DoorTrigger : MonoBehaviour
{

    public Rigidbody door;

    private void OnTriggerEnter(Collider other)
    {
        door.isKinematic = false;
    }
}
