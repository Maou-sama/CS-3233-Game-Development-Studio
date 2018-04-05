using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class ButtonTrigger : MonoBehaviour {

    public BulletBehavior ball;

    private void OnCollisionEnter(Collision collision)
    {
        GetComponent<Rigidbody>().isKinematic = false;
        if (ball.shoot == 0)
        {
            ball.shoot = 1;
        }
    }
}
