class ROTTGame_MultiplayerIDM extends ROTTGame_MultiplayerDM;

var ROTTWeaponInstagibPistol InstagibPistolArchetype;

function AddDefaultInventory(Pawn P)
{
	local ROTTInventoryManager IM;

	super(ROTTGameBase).AddDefaultInventory(P);

    if (P.IsA('ROTTPawnHero'))
    {
		IM = ROTTInventoryManager(P.InvManager);
		if (IM != None)
		{
			IM.CreateWeaponFromArchetype(InstagibPistolArchetype, false);
		}
	}
}

function bool CheckRelevance(Actor Other)
{
	if (Other.IsA('ROTTKnife'))
	{
		ROTTKnife(Other).DamageType = class'ROTTDamageType_Missile';
		return true;
	}

	if (Other.IsA('ROTTPickupFactory'))
	{
		return Other.IsA('ROTTPickupFactory_Powerup_ElastoModePowerdown')
			|| Other.IsA('ROTTPickupFactory_Powerup_MercuryMode')
			|| Other.IsA('ROTTPickupFactory_Powerup_ShroomsModePowerdown');
	}

	if (Other.IsA('ROTTWeaponPistol'))
	{
		return Other.IsA('ROTTWeaponInstagibPistol');
	}

	return super.CheckRelevance(Other);
}

function ReduceDamage(out int Damage, pawn Injured, Controller InstigatedBy, vector HitLocation, out vector Momentum, class<DamageType> DamageType, Actor DamageCauser)
{
	super.ReduceDamage(Damage, Injured, InstigatedBy, HitLocation, Momentum, DamageType, DamageCauser);

	if ((ROTTPawnHero(InstigatedBy.Pawn) != None) && DamageCauser.IsA('ROTTKnife'))
	{
		Damage = 9001;
		if (FRand() <= ROTTPawnHero(InstigatedBy.Pawn).LudicrousGibsChance)
		{
			ROTTPawnHero(InstigatedBy.Pawn).CheckLudicousGibs();
		}
	}
}

defaultproperties
{
	Acronym="IDM"
	InstagibPistolArchetype=ROTTWeaponInstagibPistol'InstagibArchetypes.InstagibPistol'
}