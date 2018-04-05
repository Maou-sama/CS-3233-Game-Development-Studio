using UnityEngine;
using System.Collections;

public class CamTrigger1 : MonoBehaviour
{

    public MultiCameraControl mcc;

    public Camera camToActivate;

    private void OnTriggerEnter(Collider other)
    {
        if(other.gameObject.name == "Sphere")
        {
            mcc.DeactivateAllCam();
            camToActivate.enabled = true;
        }
    }
}
