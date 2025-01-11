using Godot;
using System;

[GlobalClass]
public partial class Figment : Resource
{
	[Export]
	public string speciesName { get; set; }
	[Export]
	public int m_PercentHealth { get; set; }
	[Export]
	public int m_PercentPower { get; set; }
	[Export]
	public int m_PercentDefense { get; set; }
	[Export]
	public int m_PercentResilience { get; set; }
	[Export]
	public int m_PercentSpeed { get; set; }
	
	//needs 2 abilities per figment
	//need move list of 12 per mon
	//need two art's. full art and pixel art (also might need a back sprite for battles)
	//need to add type

	// Make sure you provide a parameterless constructor.
	// In C#, a parameterless constructor is different from a
	// constructor with all default values.
	// Without a parameterless constructor, Godot will have problems
	// creating and editing your resource via the inspector.
	public Figment() : this("", 0, 0, 0, 0, 0) {}

	public Figment(string name, int pHealth, int pPower, int pDefense, int pResilience, int pSpeed)
	{

	}
}
