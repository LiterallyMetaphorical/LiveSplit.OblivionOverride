// ANGER FOOT Load Remover and Auto Splitter written by Ero, Micrologist, Meta, & Marczeslaw
// Thanks to Tedder and 2838 for helping out in the Tool Development Discord.

state("Oblivion Override")
{
    float IGT : "UnityPlayer.dll", 0x015B2D28, 0x128, 0x1E0, 0x50, 0xA8, 0x40, 0x58, 0x1EC;
}

startup
{
    if (timer.CurrentTimingMethod == TimingMethod.RealTime)
	{        
		var timingMessage = MessageBox.Show (
			"This game uses Time without Loads (Game Time) as the main timing method.\n"+
			"LiveSplit is currently set to show Real Time (RTA).\n"+
			"Would you like to set the timing method to Game Time?",
			"LiveSplit | Oblivion Override",
			MessageBoxButtons.YesNo,MessageBoxIcon.Question
		);
		
		if (timingMessage == DialogResult.Yes)
		{
			timer.CurrentTimingMethod = TimingMethod.GameTime;
		}
	}
}

init 
{
    vars.totalGameTime = 0;
}

start
{
    return current.IGT > old.IGT;
}

gameTime 
{
    return TimeSpan.FromSeconds(current.IGT);
}

isLoading
{
    return true;
}

update
{
//DEBUG CODE 
print(current.IGT.ToString()); 
//print(modules.First().ModuleMemorySize.ToString());
}
