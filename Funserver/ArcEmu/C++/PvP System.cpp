{\rtf1\ansi\ansicpg1252\deff0\deflang1033{\fonttbl{\f0\fswiss\fcharset0 Arial;}}
{\*\generator Msftedit 5.41.15.1515;}\viewkind4\uc1\pard\f0\fs20 //Made by ??\par
//Modified by WigSplitta whole code\par
//Re-Modified and Rewritten by HalestormXV (Added More Features and events)\par
//Random Dice Concept to Hopla for Helping me\par
\par
\par
#include "StdAfx.h"\par
#include "Setup.h"\par
\par
#define GOLD_AMOUNT 1000000 //it is in copper\par
\par
#define PVP_TOKEN 19712 //Put Your Token ID Here\tab\par
\par
void onPvpKill(Player* plr, Player* victim)\par
\{\par
if(plr->getLevel() >= 80 && victim->getLevel() >= 80 && plr->GetTeam() != victim->GetTeam())\par
\{\par
char message[200];\par
sprintf(message, "|cff00ff00[World PvP]|r |cffff0000%s has killed %s...The hunt begins!|r", plr->GetName(), victim->GetName());\par
sWorld.SendWorldWideScreenText(message);\par
sLog.outColor(TRED,"\\n[WPVP]: WPVP Activated - the killer was %s...The victim was %s.", plr->GetName(), victim->GetName());\par
sLog.outColor(TNORMAL,"\\n");\par
int32 gold_check_p = plr->GetUInt32Value( PLAYER_FIELD_COINAGE );\par
int32 gold_check_v = victim->GetUInt32Value( PLAYER_FIELD_COINAGE );\par
int32 new_gold_p = gold_check_p + GOLD_AMOUNT;\par
int32 new_gold_v;\par
if(gold_check_v < GOLD_AMOUNT)\par
\{\par
new_gold_v = 0;\par
\}\par
else\par
\{\par
new_gold_v = gold_check_v - GOLD_AMOUNT;\par
\}\par
plr->SetUInt32Value( PLAYER_FIELD_COINAGE, new_gold_p );\par
plr->BroadcastMessage("You have gained 100 gold for this kill and the victim's soul for your own use.");\par
plr->CastSpell(plr, 27239, true);\par
plr->PlaySoundToSet(11466);\par
victim->SetUInt32Value( PLAYER_FIELD_COINAGE, new_gold_v );\par
victim->BroadcastMessage("You have lost 100 gold and your soul! Learn to fight!!");\par
\par
\par
int Chance = 20;\par
int Generator = RandomUInt(100);\par
\par
if(Generator <= Chance)\par
\{\par
plr->GetItemInterface()->SafeAddItem(PVP_TOKEN, INVENTORY_SLOT_NOT_SET, -1);\par
Item * it = objmgr.CreateItem(PVP_TOKEN, plr);\par
plr->GetItemInterface()->AddItemToFreeSlot(it);\par
sLog.outColor(TGREEN,"[WPVP]: A Token was added for this kill to %s", plr->GetName());\par
sLog.outColor(TNORMAL,"\\n");\par
\}\par
else\par
\{\par
sLog.outColor(TYELLOW,"[WPVP]: A Token was not added to %s", plr->GetName());\par
sLog.outColor(TNORMAL,"\\n");\par
\}\par
\par
\}\par
\}\par
void SetupPvP(ScriptMgr * mgr)\par
\{\par
mgr->register_hook(SERVER_HOOK_EVENT_ON_KILL_PLAYER, (void*)onPvpKill);\par
\}\par
}
 