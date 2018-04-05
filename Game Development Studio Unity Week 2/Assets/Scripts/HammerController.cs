using UnityEngine;
using System.Collections;

public class HammerController : MonoBehaviour
{
    public Rigidbody hammer;
    // Use this for initialization
    private void OnTriggerEnter(Collider other)
    {
        hammer.AddForce(hammer.transform.right * -4, ForceMode.Impulse);
    }
}
