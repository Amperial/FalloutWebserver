<%@ page import="ninja.amp.fallout.FalloutCore" %>
<%@ page import="ninja.amp.fallout.character.Character" %>
<%@ page import="ninja.amp.fallout.character.CharacterManager" %>
<%@ page import="ninja.amp.fallout.character.Perk" %>
<%@ page import="ninja.amp.fallout.config.FOConfig" %>
<%@ page import="org.bukkit.configuration.file.FileConfiguration" %>
<%@ page import="ninja.amp.fallout.command.commands.character.knowledge.Information" %>
<%@ page import="ninja.amp.fallout.character.Special" %>
<%@ page import="ninja.amp.fallout.character.Trait" %>
<%@ page import="ninja.amp.fallout.character.Skill" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html class="no-js" lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Fallout Wasteland Legends: ${param["character"]}</title>
    <link rel="shortcut icon" href="img/favicon.ico">
    <link rel="stylesheet" href="css/normalize.css">
    <link rel="stylesheet" href="css/foundation.css">
    <link rel="stylesheet" href="css/app.css">
    <link rel="stylesheet" href="http://fonts.googleapis.com/css?family=Open+Sans">
    <script src="js/vendor/modernizr.js"></script>
</head>
<body>
<div id="wrapper">
    <br>

    <%@include file="WEB-INF/header.jsp" %>

    <div class="row content-main">
        <br>

        <div class="small-12 small-centered columns">
            <div class="small-12 small-centered columns content-inner">
                <div class="small-10 small-centered columns" style="font-size: 16px">
                    <br>
                    <%
                        FalloutCore fallout = (FalloutCore) application.getAttribute("fallout");
                        CharacterManager characterManager = fallout.getCharacterManager();

                        String characterName = request.getParameter("character");
                        if (characterName != null && !characterName.isEmpty() && characterManager.isCharacter(characterName)) {
                            Character character = characterManager.getCharacterByName(characterName);
                            if (character == null) {
                                FileConfiguration characterConfig = fallout.getConfigManager().getConfig(FOConfig.CHARACTER);
                                try {
                                    character = new Character(characterConfig.getConfigurationSection(characterName.toLowerCase()));
                                } catch (Exception e) {
                                    fallout.getMessenger().debug(e);
                                }
                            }
                            if (character == null) {
                    %>
                    Error loading character!
                    <%
                    } else {
                        characterName = character.getCharacterName().replace('_', ' ');
                        String ownerName = character.getOwnerName();
                        if (ownerName == null) {
                            ownerName = "char";
                        }
                    %>
                    <h3 class="text-center"><%= characterName %></h3>
                    <hr/>
                    <h4 class="text-center"><%= character.getOwnerName() == null ? "abandoned" : ownerName %></h4>
                    <br>
                    <ul class="small-block-grid-6 small-centered text-center">
                        <li>
                            Gender:<br>
                            <%= character.getGender() == ninja.amp.fallout.character.Character.Gender.MALE ? "Male" : "Female" %>
                        </li>
                        <li>
                            Race:<br>
                            <%= character.getRace().getName() %>
                        </li>
                        <li>
                            Alignment:<br>
                            <%= character.getAlignment().getName() %>
                        </li>
                        <li>
                            Age:<br>
                            <%= character.getAge() %>
                        </li>
                        <li>
                            Height:<br>
                            <%= character.getHeight() %>
                        </li>
                        <li>
                            Weight:<br>
                            <%= character.getWeight() %>
                        </li>
                    </ul>
                    <br>

                    <ul class="small-block-grid-3 small-centered text-center">
                        <li>
                            Level: <%= character.getLevel() %><br><br>
                            Perks:<br>
                            <ul class="circle">
                                <%
                                    for (Perk perk : character.getPerks()) {
                                %>
                                <li>Tier <%= perk.getTier() %>: <%= perk.getName() %></li>
                                <%
                                    }
                                %>
                            </ul>
                        </li>
                        <li>
                            <img class="image-center" src="https://minotar.net/body/<%= ownerName %>/100" title="<%= ownerName %>">
                        </li>
                        <li>
                            Faction: <%= character.getFaction() == null ? "No Allegiance" : character.getFaction() %><br><br>
                            Knowledge:<br>
                            <ul class="circle">
                                <%
                                    for (String information : Information.getInformationPieces()) {
                                        if (character.hasKnowledge(information)) {
                                %>
                                <li><%= information %></li>
                                <%
                                        }
                                    }
                                %>
                            </ul>
                        </li>
                    </ul>

                    <h4 class="text-center">SPECIAL Traits</h4>
                    <ul class="small-block-grid-7 small-centered text-center">
                        <%
                            Special special = character.getSpecial();
                        %>
                        <li>
                            <span class="text-circle">S: <%= special.get(Trait.STRENGTH) %></span>
                        </li>
                        <li>
                            <span class="text-circle">P: <%= special.get(Trait.PERCEPTION) %></span>
                        </li>
                        <li>
                            <span class="text-circle">E: <%= special.get(Trait.ENDURANCE) %></span>
                        </li>
                        <li>
                            <span class="text-circle">C: <%= special.get(Trait.CHARISMA) %></span>
                        </li>
                        <li>
                            <span class="text-circle">I: <%= special.get(Trait.INTELLIGENCE) %></span>
                        </li>
                        <li>
                            <span class="text-circle">A: <%= special.get(Trait.AGILITY) %></span>
                        </li>
                        <li>
                            <span class="text-circle">L: <%= special.get(Trait.LUCK) %></span>
                        </li>
                    </ul>

                    <h4 class="text-center">Skills</h4>
                    <ul class="small-block-grid-7 small-centered text-center">
                        <li>
                            Big Guns<br><br>
                            <span class="text-circle"><%= character.skillLevel(Skill.BIG_GUNS) %></span><br><br>
                            Explosives<br><br>
                            <span class="text-circle"><%= character.skillLevel(Skill.EXPLOSIVES) %></span>
                        </li>
                        <li>
                            Conventional Guns<br>
                            <span class="text-circle"><%= character.skillLevel(Skill.CONVENTIONAL_GUNS) %></span><br><br>
                            Unarmed<br><br>
                            <span class="text-circle"><%= character.skillLevel(Skill.UNARMED) %></span>
                        </li>
                        <li>
                            Energy Weapons<br>
                            <span class="text-circle"><%= character.skillLevel(Skill.ENERGY_WEAPONS) %></span><br><br>
                            First Aid<br><br>
                            <span class="text-circle"><%= character.skillLevel(Skill.FIRST_AID) %></span>
                        </li>
                        <li>
                            Melee Weapons<br>
                            <span class="text-circle"><%= character.skillLevel(Skill.MELEE_WEAPONS) %></span><br><br>
                            Surgery<br><br>
                            <span class="text-circle"><%= character.skillLevel(Skill.SURGERY) %></span>
                        </li>
                        <li>
                            Lockpicking<br><br>
                            <span class="text-circle"><%= character.skillLevel(Skill.LOCKPICKING) %></span><br><br>
                            Repair<br><br>
                            <span class="text-circle"><%= character.skillLevel(Skill.REPAIR) %></span>
                        </li>
                        <li>
                            Sneak<br><br>
                            <span class="text-circle"><%= character.skillLevel(Skill.SNEAK) %></span><br><br>
                            Science<br><br>
                            <span class="text-circle"><%= character.skillLevel(Skill.SCIENCE) %></span>
                        </li>
                        <li>
                            Speech<br><br>
                            <span class="text-circle"><%= character.skillLevel(Skill.SPEECH) %></span><br><br>
                            Logical Thinking<br>
                            <span class="text-circle"><%= character.skillLevel(Skill.LOGICAL_THINKING) %></span>
                        </li>
                    </ul>
                    <hr/>
                    <h4 class="text-center">Personality</h4><br>
                    <br>
                    <h4 class="text-center">Back Story</h4>
                    <%
                        }
                    } else {
                    %>
                    Character does not exist!
                    <%
                        }
                    %>
                </div>
                <br>
            </div>
        </div>
        <br>
    </div>
    <br>

    <div class="clearfooter"></div>
</div>

<%@include file="WEB-INF/footer.jsp" %>

<script src="js/vendor/jquery.js"></script>
<script src="js/foundation.min.js"></script>
<script>
    $(document).foundation();
</script>
</body>
</html>
