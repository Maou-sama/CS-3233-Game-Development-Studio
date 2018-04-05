using UnityEngine;
using System.Collections;

public class BulletBehavior : MonoBehaviour
{

    public int shoot = 0;

    private void Update()
    {
        if (shoot == 1)
        {
            GetComponent<Rigidbody>().isKinematic = false;
            GetComponent<Rigidbody>().AddForce(transform.forward * -20, ForceMode.Impulse);
            shoot = 2;
        }
    }
}
