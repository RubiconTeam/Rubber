global using Godot;
global using System;

namespace Rubber;
public partial class Main : Control
{
	public override void _Ready()
	{
		base._Ready();
		GD.Print("helo");
	}
}
