<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
   
    xpath-default-namespace="http://www.tei-c.org/ns/1.0"
    
    version="2.0">
    <!-- 1. INSTRUCTION D'OUTPUT : HTML -->
    <xsl:output method="html" indent="yes"/>
    
    <!-- CREATION DE VARIABLES POUR LES DOCUMENTS DE SORTIE -->
    <xsl:variable name="home">
        <xsl:value-of select="concat('Monte_Cristo_home','.html')"/>
        <!-- variable pour le contenu du home  -->
    </xsl:variable>
    <xsl:variable name="chap1">
        <xsl:value-of select="concat('Monte_Cristo_chap1','.html')"/>
        <!-- variable pour le contenu du premier chapitre  -->
    </xsl:variable>
    <xsl:variable name="chap2">
        <xsl:value-of select="concat('Monte_Cristo_chap2','.html')"/>
        <!-- variable pour le contenu du deuxième chapitre  -->
    </xsl:variable>
    <xsl:variable name="chap3">
        <xsl:value-of select="concat('Monte_Cristo_chap3','.html')"/>
        <!-- variable pour le contenu du troisième chapitre  -->
    </xsl:variable>
    <xsl:variable name="index">
        <xsl:value-of select="concat('Monte_Cristo_index','.html')"/>
        <!-- variable pour le contenu de l'index  -->
    </xsl:variable>
    
    <!-- VARIABLE AVEC LE <HEAD> -->
    <xsl:variable name="header">
        <head>
            <meta name="viewport" content="width=device-width, initial-scale=1"/>
            <title><xsl:value-of select="//fileDesc/titleStmt/title[@level='m']"/></title>
            <meta name="description">
                <xsl:attribute name="content">
                    <xsl:value-of select="//fileDesc/titleStmt/author"/><xsl:text> par </xsl:text><xsl:value-of select="//fileDesc/titleStmt/author"/>
                </xsl:attribute>
            </meta>
            <meta name="author">
                <xsl:attribute name="content">
                    <xsl:value-of select="//fileDesc//name"/> 
                </xsl:attribute>
            </meta>
            <!-- CSS POUR L'APPARENCE -->
            <style>
            footer{
            background-color: rgb(6, 30, 133);
            color: rgb(243, 243, 127);
            padding-left: 20%;
            padding-right: 20%;
            border-radius: 10px 10px 0 0;
            text-align: center;}
            
            a { text-decoration: none;
            }
            
           
            
            nav{  text-align: center;
            font-size: large;
            padding-bottom: 10%;
            }
            
            .bodyheader{
            border-radius: 0 0 10px 10px;
            background-color: rgb(6, 30, 133);
            color: rgb(243, 243, 127);
            padding-top: 5%;
            }
            </style>
            
            <!-- Lien vers une stylesheet bootstrap pour l'apparence générale -->
            <link rel="stylesheet"
                href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
                integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
                crossorigin="anonymous"/>
            
        </head>
    </xsl:variable>
    
    
    <!-- VARIABLE AVEC LE <FOOTER> -->
    <xsl:variable name="footer">
        <footer>
            <p><i><xsl:value-of select="//fileDesc/titleStmt/respStmt"/>. <a href="https://github.com/annaleduff/TEI_Le-Comte-de-Monte-Cristo_M2TNAH">Consulter l'encodage
                XML</a></i></p>
        </footer>
    </xsl:variable>
    
    <!-- VARIABLE AVEC LE CSS DU <BODY> -->
    <xsl:variable name="body_css">
        <xsl:text>
            margin-right: 20%; margin-left: 20%; margin-top: 1%; margin-bottom: 0;
            font-family: "Georgia", serif;
            background-color: antiquewhite;
            
            
      </xsl:text>
            
    </xsl:variable>
    
    <!-- VARIABLES AVEC LES LIENS DE RETOUR -->
    <xsl:variable name="return_home">
        <i><a href="{concat('./', $home)}">Revenir à l'accueil</a></i>
    </xsl:variable>
    
    <xsl:variable name="return_index">
        <i><a href="{concat('./', $index)}">Index des noms de lieux et de personnes</a></i>
    </xsl:variable>
    
    <!--VARIABLES DES LIENS VERS L'INDEX-->
  
    <!--Récupération du chemin vers l'index pour renvoyer à la description de l'élément de personne indexé-->
           <xsl:variable name="pathIndexPersonnes" select="'Monte_Cristo_index.html'"/>
    
    
    <!--Récupération du chemin vers l'index pour renvoyer à la description de l'élément de lieu indexé-->
    <xsl:variable name="pathIndexLieux" select="'Monte_Cristo_index.html'"/>
    
    <!-- VARIABLE AVEC L'EN-TÊTE DU <BODY> DES PAGES -->
    <xsl:variable name="body_header">
        <div style="text-align: center; margin-bottom: 8%;" class="bodyheader">
            <h1>Édition en ligne de <i><xsl:value-of select="//fileDesc/titleStmt/title[@level='m']"/></i></h1>
           
            <p><xsl:value-of select="//fileDesc/titleStmt/author"/></p>
        </div>
    </xsl:variable>
    
    <!-- FIN DES DÉCLARATIONS DES VARIABLES -->
    
    
    <!-- TEMPLATE MATCH SUR LA RACINE AVEC LES CALL TEMPLATES DES PAGES-->
    <xsl:template match="/">
        <xsl:call-template name="home"/>
        <xsl:call-template name="chapter1"/>
        <xsl:call-template name="chapter2"/>
        <xsl:call-template name="chapter3"/>
        <xsl:call-template name="M_C_index"/>
    </xsl:template>
    
    
    <!-- TEMPLATE DE LA PAGE HOME -->
    <xsl:template name="home">
        <xsl:result-document href="{$home}" method="html">
            <html lang="fr">
                <xsl:copy-of select="$header"/>
                <body>
                    <xsl:attribute name="style">
                        <xsl:value-of select="$body_css"/>
                    </xsl:attribute>
                    <xsl:copy-of select="$body_header"/>
                    <div style="text-align: justify;">  
                        <h3 class="text-justify"> Ce site web est une édition en ligne du roman feuilleton 
                            <i><xsl:value-of select="//fileDesc/titleStmt/title[@level='m']"/></i>
                            par <xsl:value-of select="//fileDesc/titleStmt/author"/> et
                            publié en <xsl:value-of select="//fileDesc//publicationStmt[@level='m']/date"
                            /> dans le <i><xsl:value-of select="//fileDesc//publicationStmt[@level='m']/publisher"/></i>
                            .</h3>
                        <p class="text-justify"> Ces pages sont le resultat d'une
                            <b>transformation XSLT</b> réalisé à partir d'un encodage <b>XML-TEI</b>.
                            Ce projet a été réalisé dans le cadre de l'évaluation du cours
                            d'XSLT du M2 "Technologies numériques appliquées à l'histoire" à
                            l'Ecole des chartes. </p>
                        <p class="d-inline">
                            <a href="https://gallica.bnf.fr/html/und/presse-et-revues/le-comte-de-monte-cristo"
                                class="mr-5">Consulter le texte d'origine</a>
                        </p>
                        
                        
                    </div>
                    <!-- création d'un élément nav pour circuler entre les documents -->
                    <div>
                        <nav><a href="./{$chap1}">Chapitre 1</a> – <a href="./{$chap2}">Chapitre 2</a> – <a href="./{$chap3}">Chapitre 3</a> – <a href="./{$index}">Index.</a></nav>
                    </div>
                    <xsl:copy-of select="$footer"/>
                </body>
            </html>
        </xsl:result-document>
    </xsl:template>
    
    <!-- TEMPLATES DE LA PAGE CHAPITRE 1 -->
    <xsl:template name="chapter1">
        <xsl:result-document href="{$chap1}" method="html">
            <html lang="fr">
                <xsl:copy-of select="$header"/>
                <body>
                    <xsl:attribute name="style">
                        <xsl:value-of select="$body_css"/>
                    </xsl:attribute>
                    <xsl:copy-of select="$body_header"/>
                    <div>
                        <h3 style="text-align: center; padding-bottom: 2%;">Chapitre I.<xsl:value-of select="//TEI/text//div1/div2[@n='1']/head"/></h3>
                        <xsl:apply-templates select="//TEI/text//div1/div2[@n='1']" mode="chapter1"/>
                    </div>
                  
                    <xsl:copy-of select="$footer"/>
                </body>
            </html>
        </xsl:result-document>
    </xsl:template>
    
    <xsl:template match="//TEI/text//div1/div2[@n='1']" mode="chapter1">
        <div style="text-align: justify;">
            <xsl:for-each select="./p">
                <!-- boucle afin de reproduire chaque <p> séparément -->
                <p><xsl:apply-templates/></p>
            </xsl:for-each>
            <nav> <a href="./{$chap2}">Chapitre suivant</a> –
            <xsl:copy-of select="$return_home"/> – <xsl:copy-of select="$return_index"/> </nav>
        </div>
    </xsl:template>
    
    <!-- TEMPLATES DE LA PAGE CHAPITRE 2 -->
    <xsl:template name="chapter2">
        <xsl:result-document href="{$chap2}" method="html">
            <html lang="fr">
                <xsl:copy-of select="$header"/>
                <body>
                    <xsl:attribute name="style">
                        <xsl:value-of select="$body_css"/>
                    </xsl:attribute>
                    <xsl:copy-of select="$body_header"/>
                    <div style="text-align: justify;">
                        <h3 style="text-align: center; padding-bottom: 2%;">Chapitre II. <xsl:value-of select="//TEI/text//div1/div2[@n='2']/head"/></h3>
                        <!-- ajout d'un @mode pour différencier le traitement du texte -->
                        <!-- texte du chapitre 2 de celui du chapitre 1 -->
                        <xsl:apply-templates select="//TEI/text//div1/div2[@n='2']" mode="chapter2"/>
                        
                        
                    </div>
                    <xsl:copy-of select="$footer"/>
                </body>
            </html>
        </xsl:result-document>
    </xsl:template>
    
    
    <xsl:template match="//TEI/text//div1/div2[@n='2']" mode="chapter2">
        <div style="text-align: justify;">
            <xsl:for-each select="./p">
                <!-- boucle afin de reproduire chaque <p> séparément -->
                <p><xsl:apply-templates/></p>
            </xsl:for-each>
            <nav> <a href="./{$chap1}">Chapitre précédent</a> –
                <a href="./{$chap3}">Chapitre suivant</a>  –
            <xsl:copy-of select="$return_home"/> – <xsl:copy-of select="$return_index"/> </nav>
        </div>
    </xsl:template>
    
    <!-- TEMPLATES DE LA PAGE CHAPITRE 3 -->
    <xsl:template name="chapter3">
        <xsl:result-document href="{$chap3}" method="html">
            <html lang="fr">
                <xsl:copy-of select="$header"/>
                <body>
                    <xsl:attribute name="style">
                        <xsl:value-of select="$body_css"/>
                    </xsl:attribute>
                    <xsl:copy-of select="$body_header"/>
                    <div style="text-align: justify;">
                        <h3 style="text-align: center; padding-bottom: 2%;">Chapitre III. <xsl:value-of select="//TEI/text//div1/div2[@n='3']/head"/></h3>
                        
                        <xsl:apply-templates select="//TEI/text//div1/div2[@n='3']" mode="chapter3"/>
                        
                    </div>
                    <xsl:copy-of select="$footer"/>
                </body>
            </html>
        </xsl:result-document>
    </xsl:template>
    
    
    <xsl:template match="//TEI/text//div1/div2[@n='3']" mode="chapter3">
        <div style="text-align: justify;">
            <xsl:for-each select="./p">
                <!-- boucle afin de reproduire chaque <p> séparément -->
                <p><xsl:apply-templates/></p>
            </xsl:for-each>
            <nav> <a href="./{$chap2}">Chapitre précédent</a> –
            
            <xsl:copy-of select="$return_home"/> – <xsl:copy-of select="$return_index"/> </nav>
        </div>
    </xsl:template>
    
    <!-- TEMPLATES DE LA PAGE INDEX -->
    <xsl:template name="M_C_index">
        <xsl:result-document href="{$index}">
            <html lang="fr">
                <xsl:copy-of select="$header"/>
                <body>
                    <xsl:attribute name="style">
                        <xsl:value-of select="$body_css"/>
                    </xsl:attribute>
                    <xsl:copy-of select="$body_header"/>
                    <div>
                        <h1>Index</h1>
                        <div>
                            <h3>Index de personnages</h3>
                            <p>
                            <!--Appel de la template personnes-->
                            <xsl:call-template name="personnes"/>    
                            </p>
                            <h3>Index de lieux</h3>
                            <p> <!--Appel de la template lieux-->
                                <xsl:call-template name="lieux"/>  
                            </p>
                            <h3>Index des objets</h3>
                            <p> <!--Appel de la template objet-->
                                <xsl:call-template name="objet"/>  
                            </p>
                        </div>
                        
                        <nav><xsl:copy-of select="$return_home"/> – <a href="./{$chap1}">Chapitre 1</a> – <a href="./{$chap2}">Chapitre 2</a> – <a href="./{$chap3}">Chapitre 3</a></nav>
                    </div>
                    <xsl:copy-of select="$footer"/>
                </body>
            </html>
        </xsl:result-document>
    </xsl:template>
    
    <!--LES TEMPLATES INDEX-->
    <xsl:template name="personnes">
        <xsl:element name="ul">
            <!--Création et affichage d'un index de personnes-->
            <!--Pour chaque persName, on reproduit les actions suivantes-->
            <xsl:for-each select="//particDesc//person/persName">
                <!--on trie les différents personnages dans l'ordre alphabétique-->
                <xsl:sort select="./surname" order="ascending"/>
                <!--Chaque personne est affichée dans un li, permettant de réaliser une liste si il y en a plusieurs-->
                <xsl:element name="li">
                    <!--On créé un attribut id, afin de pouvoir faire des renvois depuis le texte vers les descriptions dans l'index de personnages-->
                    <xsl:attribute name="id">
                        <!--On récupère l'xml:id situé dans le person au niveau supérieur-->
                        <xsl:value-of select="parent::person/@xml:id"/>
                    </xsl:attribute>
                    <!--l'élément b permet de mettre en gras le nom de chaque personne-->
                    <xsl:element name="b">
                        <!--Si le nom du personnage est divisé en forename, surname, on récupère ces éléments, auquel cas, on vérifie si un roleName 
                            existe et si oui, on le récupère. Autrement on récupère directement le texte situé dans le persName-->
                        <xsl:choose>
                            <xsl:when test="./forename">
                                <xsl:value-of select="./forename"/>&#160;<xsl:value-of
                                    select="./surname"/>
                                <xsl:choose>
                                   <!-- Si il y a des addName on les récupère aussi  -->
                                    <xsl:when test="./addName">, <xsl:text>Alias :</xsl:text>&#160;<xsl:value-of
                                        select="./addName"/>
                                    </xsl:when>
                                    
                                </xsl:choose>
                            </xsl:when>
                            <xsl:otherwise>
                                <xsl:value-of select="."/>
                            </xsl:otherwise>
                        </xsl:choose>
                    </xsl:element>
                    <!--On créé une variable contenant le xml:id de la personne-->
                    <xsl:variable name="idPerson">
                        <xsl:value-of select="parent::person/@xml:id"/>
                    </xsl:variable>
                    <xsl:text>:&#160;</xsl:text>
                    
                    <!--On affiche la description du personnage-->
                    <xsl:if test="parent::person//note">
                        <xsl:element name="p">
                            <xsl:value-of select="parent::person//note"/>
                        </xsl:element>
                    </xsl:if>
                </xsl:element>
            </xsl:for-each>
        </xsl:element>
    </xsl:template>
    
    <xsl:template name="lieux">
        <xsl:element name="ul">
            <!--Création et affichage d'un index de lieux-->
            <xsl:for-each select="//listPlace/place">
                <!--On trie les lieux par ordre alphabétique-->
                <xsl:sort select="./placeName" order="ascending"/>
                <xsl:element name="li">
                    <!--Chaque lieux est contenue dans une balise li afin d'obtenir une liste-->
                    <xsl:attribute name="id">
                        <xsl:value-of select="@xml:id"/>
                    </xsl:attribute>
                    <xsl:element name="b">                       
                        <xsl:value-of select="./placeName/name"/>
                    </xsl:element>
                    <!--Si l'emplacement du lieu est mentionné, on l'ajoute-->
                    <xsl:if test=".//country">  <xsl:text>&#160;</xsl:text>
                        <xsl:value-of select=".//country"/>
                    </xsl:if>
                    <xsl:if test=".//settlement">
                        <xsl:text>,&#160;</xsl:text>
                        <xsl:value-of select=".//settlement"/>
                    </xsl:if>
                    <!--Création d'une variable contenant l'xml:id du lieu-->
                    <xsl:variable name="idPlace">
                        <xsl:value-of select="@xml:id"/>
                    </xsl:variable>
                    
                    
                    <!--Si il y a une description du lieu, on l'ajoute à la suite-->
                    <xsl:if test="./note">
                        <xsl:element name="p">
                            <xsl:value-of select="./note"/>
                        </xsl:element>
                    </xsl:if>
                </xsl:element>
            </xsl:for-each>
        </xsl:element>
    </xsl:template>
    
    
    <xsl:template name="objet">
        <xsl:element name="ul">
            <!-- Création et affichage d'un index des objets -->
            <!-- Pour chaque objet, on reproduit les actions suivantes -->
            <xsl:for-each select="//listObject/object">
                <!-- On trie les différents objets dans l'ordre alphabétique -->
                <xsl:sort select="./objectIdentifier/objectName" order="ascending"/>
                <!-- Chaque objet est affiché dans un li, permettant de réaliser une liste -->
                <xsl:element name="li">
                    <!-- On crée un attribut id, afin de pouvoir faire des renvois depuis le texte vers les descriptions dans l'index d'objets -->
                    <xsl:attribute name="id">
                        <!-- On récupère l'xml:id situé dans l'objet -->
                        <xsl:value-of select="@xml:id"/>
                    </xsl:attribute>
                    <!-- L'élément b permet de mettre en gras le nom de chaque objet -->
                    <xsl:element name="b">
                        <xsl:value-of select="./objectIdentifier/objectName"/>
                    </xsl:element>
                    <!-- On affiche la description physique de l'objet -->
                    <xsl:if test="./physDesc">
                        <xsl:element name="p">
                            <xsl:value-of select="./physDesc/p"/>
                        </xsl:element>
                    </xsl:if>
                    <!-- On affiche la description de l'objet -->
                    <xsl:if test="./note">
                        <xsl:element name="p">
                            <xsl:value-of select="./note"/>
                        </xsl:element>
                    </xsl:if>
                </xsl:element>
            </xsl:for-each>
        </xsl:element>
    </xsl:template>
    
    
    
    <!-- LIENS POUR RENVOYER VERS LES DESCRIPTIONS DE L'INDEX -->
    
    <xsl:template match="body//persName[@ref]">
       
        <!--Création d'une balise a avec un attribut href contenant: url de l'index de personnes#nom de la personne-->
        <xsl:element name="a">
            <xsl:attribute name="href">
                <xsl:copy-of select="$pathIndexPersonnes"/><xsl:value-of select="@ref"/>
            </xsl:attribute>
            <xsl:apply-templates/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="body//rs[@type='person'][@ref]">
        <!-- Création d'une balise a avec un attribut href contenant: url de l'index de personnes#nom de la personne -->
        <xsl:element name="a">
            <xsl:attribute name="href">
                <xsl:value-of select="$pathIndexPersonnes"/><xsl:value-of select="@ref"/>
            </xsl:attribute>
            <xsl:apply-templates/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="body//placeName[@ref]">
        
   <xsl:for-each select=".">
        <!--renvoyer à la description dans l'index de Lieux-->
        <xsl:variable name="pathIndexLieux" select="'Monte_Cristo_index.html'"/>
        <a href="{$pathIndexLieux}#{@ref}">
            <xsl:apply-templates/>
        </a>
   </xsl:for-each>
    </xsl:template>
    
    <xsl:template match="body//rs[@type='city'][@ref]">
        <!-- Création d'une balise a avec un attribut href contenant: url de l'index de personnes#nom de la personne -->
        <xsl:element name="a">
            <xsl:attribute name="href">
                <xsl:value-of select="$pathIndexLieux"/><xsl:value-of select="@ref"/>
            </xsl:attribute>
            <xsl:apply-templates/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="body//ref">
        
        <!--Création d'une balise a avec un attribut href contenant: url de l'index objet-->
        <xsl:element name="a">
            <xsl:attribute name="href">
                <xsl:copy-of select="$pathIndexPersonnes"/><xsl:value-of select="@ref"/>
            </xsl:attribute>
            <xsl:apply-templates/>
        </xsl:element>
    </xsl:template>
</xsl:stylesheet>