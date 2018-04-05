using UnityEngine;
using System.Collections;

public class LightControl : MonoBehaviour
{

    public Light light;

    private void OnTriggerEnter(Collider other)
    {
        light.enabled = true;
    }
}
