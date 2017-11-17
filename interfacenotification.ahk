

loop, V:\3mhis\CONNPLUS\data\running.*

{
    Hours := A_Now
    EnvSub, Hours, %A_LoopFileTimeModified%, Hours
    
}
If ( Hours >= 1 )
	{
    run, mailto:hims@imail.org?subject=running.live stopped&body=Please check HDM Interfaces. A 'running' file may be stuck.
    sleep 1000
    Send, ^{enter}
    }
