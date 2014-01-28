class ROTTWeaponInstagibPistol extends ROTTWeaponPistol;

var float InstagibFireInterval[5];
var float LudicrousGibsRadiusSq;

simulated function float GetFireInterval(byte FireModeNum)
{
	if (ROTTPawnHero(Owner) != None)
	{
		return InstagibFireInterval[ROTTPawnHero(Owner).SPCharacterID - 1];
	}
	return 1.5;
}

simulated function ProcessInstantHit(byte FiringMode, ImpactInfo Impact, optional int NumHits)
{
	local int H;
	local vector V;

	if ((ROTTPawnHero(Instigator) != None) &&
		(Pawn(Impact.HitActor) != None) &&
		(FRand() <= ROTTPawnHero(Instigator).LudicrousGibsChance))
	{
		H = Pawn(Impact.HitActor).Health;
		super.ProcessInstantHit(FiringMode, Impact, NumHits);
		if (Pawn(Impact.HitActor).Health != H)
		{
			V = Impact.HitActor.Location - Instigator.Location;
			if ((V dot V) <= LudicrousGibsRadiusSq)
			{
				ROTTPawnHero(Instigator).CheckLudicousGibs();
			}
		}
	}
	else
	{
		super.ProcessInstantHit(FiringMode, Impact, NumHits);
	}
}

defaultproperties
{
	InstagibFireInterval(0)=1.5
	InstagibFireInterval(1)=1.75
	InstagibFireInterval(2)=2.0
	InstagibFireInterval(3)=1.25
	InstagibFireInterval(4)=1.0

	InstantHitDamageTypes(0)=class'ROTTDamageType_Missile'

	LudicrousGibsRadiusSq=250000.0
}