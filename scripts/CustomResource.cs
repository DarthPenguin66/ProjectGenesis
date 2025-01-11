using Godot;
using System;

public partial class CustomResource : Resource
{
	
	[Export]
	public int Number { get; set; } = 5;
	
}
