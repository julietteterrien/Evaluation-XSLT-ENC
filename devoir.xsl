<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xpath-default-namespace="http://www.tei-c.org/ns/1.0" version="2.0">

    <xsl:output method="html"/>

    <!-- Variable pour le head -->
    <xsl:variable name="head">
        <head>
            <meta charset="utf-8"/>
            <title>Les Caprices de Marianne</title>
            <!-- Intégration de polices de caractères -->
            <link rel="preconnect" href="https://fonts.googleapis.com"/>
            <link rel="preconnect" href="https://fonts.gstatic.com"/>
            <link
                href="https://fonts.googleapis.com/css2?family=Nunito+Sans:ital,opsz,wght@0,6..12,200..1000;1,6..12,200..1000&amp;display=swap"
                rel="stylesheet"/>
            <link
                href="https://fonts.googleapis.com/css2?family=Lora:ital,wght@0,400..700;1,400..700&amp;display=swap"
                rel="stylesheet"/>
            <!-- Appel de la visionneuse Openseadragon -->
            <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"/>
            <script src="https://openseadragon.github.io/openseadragon/openseadragon.min.js"/>
        </head>
    </xsl:variable>

    <!-- Varibale pour la barre de navigation -->
    <xsl:variable name="navbar">
        <div class="navbar">
            <ul>
                <li>
                    <a href="accueil.html">Accueil</a>
                </li>
                <xsl:for-each select=".//body/div">
                    <li>
                        <a href="{concat('acte', ./@n, '.html')}">Acte <xsl:value-of select="./@n"
                            /></a>
                    </li>
                </xsl:for-each>
                <li>
                    <a href="table.html">Table des personnages</a>
                </li>
            </ul>
        </div>
        <style>
            .navbar {
                background-color: #A1B97F;
                padding: 25px 0;
                border-radius: 5px;
                display: flex;
                justify-content: center;
                align-items: center;
                box-shadow: 0px 4px 6px rgba(0, 0, 0, 0.1);
            }
            .navbar ul {
                list-style-type: none;
                display: flex;
                flex-wrap: wrap;
                gap: 30px;
                padding: 0;
                margin: 0;
            }
            .navbar ul li {
                display: inline;
            }
            .navbar ul li a {
                text-decoration: none;
                color: white;
                font-size: 22px;
                font-weight: bold;
                padding: 15px 25px;
                border-radius: 5px;
                transition: background-color 0.3s, color 0.3s;
                box-shadow: 2px 2px 5px rgba(0, 0, 0, 0.2);
            }
            .navbar ul li a:hover {
                background-color: #BF4163;
                color: white;
            }</style>
    </xsl:variable>

    <!-- Variable pour le footer -->
    <xsl:variable name="footer">
        <footer class="container-footer">
            <div class="footer-left">
                <p>Ce projet a été réalisé par <xsl:value-of select="//publicationStmt/authority"/>
                    dans le cadre du cours de XSLT du Master TNAH de l'École nationale des
                    chartes.</p>
                <p>Lien vers la page Github du projet : <a
                        href="https://github.com/julietteterrien/Evaluation-XSLT-ENC.git"
                        style="text-decoration: none; color: #BF4163; font-weight: bold;"
                        >Evaluation-XSLT-ENC</a></p>
                <p>
                    <i>
                        <xsl:value-of select="//publicationStmt//licence"/>
                    </i>
                </p>
            </div>
            <div class="footer-right">
                <img alt="Logo ENC"
                    src="https://www.chartes.psl.eu/sites/default/files/public/media/image/2025-03/logo-chartes-psl-coul.png"
                    width="300" height="47"/>
            </div>
        </footer>
        <style>
            footer {
                margin: 5em 0 0 0;
                background-color: #A1B97F;
                color: white;
                border-radius: 5px;
            }
            footer p {
                margin: 1em;
            }
            footer img {
                margin: 3em;
            }
            .container-footer {
                display: flex;
            }
            .footer-left {
                flex: 3;
            }
            .footer-right {
                flex: 1;
            }</style>
    </xsl:variable>

    <!-- Appel des templates -->
    <xsl:template match="/">
        <xsl:call-template name="accueil"/>
        <xsl:call-template name="actes"/>
        <xsl:call-template name="table"/>
        <xsl:call-template name="character"/>
    </xsl:template>

    <!-- Page d'accueil -->
    <xsl:template name="accueil">
        <xsl:result-document href="out/accueil.html" method="html" indent="yes">
            <html>
                <xsl:copy-of select="$head"/>
                <body style="margin: 1.5em 5em 5em 5em; font-family: 'Nunito'; font-size: 18px;">
                    <xsl:copy-of select="$navbar"/>
                    <h1 style="text-align: center; font-family: Lora;"><cite><xsl:value-of
                                select="//titleStmt/title"/></cite> d' <xsl:value-of
                            select="//titleStmt/author"/></h1>

                    <div>
                        <p>Découvrez une édition numérique de scènes sélectionnées des Caprices de
                            Marianne, basée sur l’édition <xsl:value-of select="//biblStruct//title"
                            />, publiée par <xsl:value-of select="//biblStruct//imprint/publisher"/>
                            en <xsl:value-of select="//biblStruct//imprint/date"/>.</p>
                        <p>Ce projet vise à mettre en valeur l'œuvre dramaturgique d'Alfred de
                            Musset, poète, dramaturge et romancier français. Le XIXe siècle voit
                            l'émergence de la forme du drame romantique, qui a la particularité de
                            conserver la structure traditionnelle du théâtre classique, tout en
                            offrant à ses figures une grande liberté de création en mélangeant les
                            genres, dont le tragique, le comique et le burlesque. L'œuvre d'Alfred
                            de Musset est un sujet d'étude régulier en littérature française.</p>
                        <p>Liens vers les pages : <a
                                style="font-weight: bold; color: #4184BF; text-decoration: none"
                                href="acte1.html">Acte 1</a> - <a
                                style="font-weight: bold; color: #4184BF; text-decoration: none"
                                href="acte2.html">Acte 2</a> - <a
                                style="font-weight: bold; color: #4184BF; text-decoration: none"
                                href="table.html">Table des personnages</a>
                        </p>
                        <br/>
                        <hr style="text-align: center; width: 75%"/>
                    </div>
                    <div class="container">
                        <style>
                            .container {
                                display: flex;
                            }
                            .column {
                                width: 50%;
                                padding: 20px;
                            }
                            .column-left {
                                flex: 1;
                            }
                            .column-right {
                                flex: 2;
                            }</style>
                        <div class="column column-left">
                            <h2 style="text-align: center;">Description</h2>
                            <table>
                                <tr>
                                    <th>Titre :</th>
                                    <td>
                                        <xsl:value-of select="//monogr/title"/>
                                    </td>
                                </tr>
                                <tr>
                                    <th>Auteur :</th>
                                    <td>
                                        <xsl:value-of select="//monogr/author"/>
                                    </td>
                                </tr>
                                <tr>
                                    <th>Éditeur :</th>
                                    <td>
                                        <xsl:value-of select="//imprint/publisher"/>
                                    </td>
                                </tr>
                                <tr>
                                    <th>Lieu de publication :</th>
                                    <td>
                                        <xsl:value-of select="//imprint/pubPlace"/>
                                    </td>
                                </tr>
                                <tr>
                                    <th>Année de publication :</th>
                                    <td>
                                        <xsl:value-of select="//imprint/date"/>
                                    </td>
                                </tr>
                                <tr>
                                    <th>Lieu de conservation :</th>
                                    <td>
                                        <xsl:value-of select="//bibl/idno"/>
                                    </td>
                                </tr>
                                <tr>
                                    <th>Numérisation :</th>
                                    <td>
                                        <a
                                            style="text-decoration: none; color: #BF4163; font-weight: bold;">
                                            <xsl:attribute name="href">
                                                <xsl:value-of select="//bibl/ref/@target"/>
                                            </xsl:attribute>
                                            <xsl:value-of select="//bibl/ref/@target"/>
                                        </a>
                                    </td>
                                </tr>
                                <tr>
                                    <th>Conditions d'utilisation :</th>
                                    <td>
                                        <a
                                            style="text-decoration: none; color: #BF4163; font-weight: bold;">
                                            <xsl:attribute name="href">
                                                <xsl:value-of
                                                  select="//bibl/availability/licence/@target"/>
                                            </xsl:attribute>
                                            <xsl:value-of
                                                select="//bibl/availability/licence/@target"/>
                                        </a>
                                    </td>
                                </tr>
                            </table>
                            <style>
                                table {
                                    text-align: left;
                                    border-collapse: collapse;
                                }
                                tr {
                                    margin-bottom: 30px;
                                    display: block;
                                }
                                th {
                                    font-weight: bold;
                                    text-align: left;
                                    width: 200px;
                                }
                                td {
                                    vertical-align: bottom;
                                }</style>
                        </div>
                        <!-- Intégration de la vionneuse -->
                        <div class="column column-right" id="visioneuse">
                            <div id="_viewer" style="width: 100%; height: 800px;"/>
                            <script type="text/javascript">
                                var _viewer = OpenSeadragon({
                                    id: "_viewer",
                                    prefixUrl: "https://openseadragon.github.io/openseadragon/images/",
                                    sequenceMode: true,
                                    tileSources:[<xsl:for-each select="//facsimile">
                                <xsl:text>'</xsl:text><xsl:value-of select="concat('https://gallica.bnf.fr/iiif/', ./graphic/@url, '/info.json')"/><xsl:text>', </xsl:text>
                            </xsl:for-each>
],
                            });</script>
                        </div>
                    </div>
                </body>
                <xsl:copy-of select="$footer"/>
            </html>
        </xsl:result-document>
    </xsl:template>

    <!-- Pages correspondant aux actes -->
    <xsl:template name="actes">
        <!-- Boucle pour sélectionner les div correspondant aux actes de la pièce -->
        <xsl:for-each select="//body/div[@type = 'act']">
            <xsl:result-document href="{concat('out/', 'acte', ./@n, '.html')}">
                <html>
                    <xsl:copy-of select="$head"/>
                    <body style="margin: 1.5em 5em 5em 5em; font-family: 'Nunito'; font-size: 18px;">
                        <xsl:copy-of select="$navbar"/>
                        <h1 style="text-align: center; font-family: Lora;">
                            <xsl:value-of select="./head"/>
                        </h1>
                        <div>
                            <!-- Deuxième boucle pour sélectionner les scènes à l'intérieur des actes de la pièce -->
                            <xsl:for-each select="./div[@type = 'scene']">
                                <h3 style="text-align: center; margin-top: 6%; font-family: Lora;">
                                    <xsl:value-of select="./head"/>
                                </h3>
                                <!-- Troisième boucle pour sélectionner à la fois les balises <sp> et <stage> présentent dans <div> et restituer tous les éléments du texte dans le bon ordre -->
                                <xsl:for-each select="./sp | ./stage">
                                    <!-- Condition pour appliquer un style particulier selon s'il s'agit d'une réplique <sp> ou d'une didascalie <stage> -->
                                    <xsl:choose>
                                        <xsl:when test="self::stage">
                                            <p
                                                style="margin-bottom: 1em; text-align: center; font-style: italic; line-height: 2;">
                                                <xsl:apply-templates/>
                                            </p>
                                        </xsl:when>
                                        <xsl:otherwise>
                                            <p style="margin-bottom: 1em;">
                                                <xsl:apply-templates/>
                                            </p>
                                        </xsl:otherwise>
                                    </xsl:choose>
                                </xsl:for-each>
                            </xsl:for-each>
                        </div>
                        <!-- Variables pour effectuer des liens de navigation entre la page Acte 1 et la page Acte 2 -->
                        <xsl:variable name="acte-precedent" select="number(./@n) - 1"/>
                        <xsl:variable name="acte-suivant" select="number(./@n) + 1"/>
                        <div style="text-align: right; margin-top: 30px;">
                            <xsl:if test="//body/div[@n = string($acte-precedent)]">
                                <a href="{concat('acte', $acte-precedent, '.html')}"
                                    style="font-weight: bold; color: #4184BF; text-decoration: none;"
                                    >Acte précédent</a>
                            </xsl:if>
                            <xsl:if test="//body/div[@n = string($acte-suivant)]">
                                <a href="{concat('acte', $acte-suivant, '.html')}"
                                    style="font-weight: bold; color: #4184BF; text-decoration: none;"
                                    >Acte suivant</a>
                            </xsl:if>
                        </div>
                    </body>
                    <xsl:copy-of select="$footer"/>
                </html>
            </xsl:result-document>
        </xsl:for-each>
    </xsl:template>

    <!-- Page de la table des personnages -->
    <xsl:template name="table">
        <xsl:result-document href="out/table.html" method="html" indent="yes">
            <html>
                <xsl:copy-of select="$head"/>
                <body style="margin: 1.5em 5em 5em 5em; font-family: 'Nunito'; font-size: 18px;">
                    <xsl:copy-of select="$navbar"/>
                    <h1 style="text-align: center; margin-bottom: 6%; font-family: Lora;">Table des
                                personnages<sup><a href="#note"
                                style="font-size: smaller; color: #BF4163; text-decoration: none;"
                                >*</a></sup></h1>
                    <!-- Boucle pour sélectionner les personnages de la pièce afin de restituer une table des personnages -->
                    <xsl:for-each select="//castItem">
                        <p style="text-align: center; line-height: 2;">
                            <a style="font-weight: bold; color: #4184BF; text-decoration: none;">
                                <xsl:attribute name="href">
                                    <xsl:value-of
                                        select="concat('character_', ./role/@xml:id, '.html')"/>
                                </xsl:attribute>
                                <xsl:value-of select="./role"/>
                                <!-- Condition pour que la description du rôle soit indiquée seulement s'il y en a une -->
                                <xsl:if test="./roleDesc">
                                    <i>
                                        <xsl:value-of select="concat(', ', ./roleDesc)"/>
                                    </i>
                                </xsl:if>
                            </a>
                        </p>
                    </xsl:for-each>
                    <!-- Création d'une note de bas de page à destination des utilisateurs -->
                    <p id="note" style="text-align: left; font-size: smaller; margin-top: 20px;"
                        >Cliquer sur le nom d'un personnage, pour accéder à ses répliques.</p>
                </body>
                <xsl:copy-of select="$footer"/>
            </html>
        </xsl:result-document>
    </xsl:template>

    <!-- Pages des personnages -->
    <xsl:template name="character">
        <!-- Boucle pour sélectionner les différents personnages -->
        <xsl:for-each select="//castItem/role">
            <xsl:variable name="characterId" select="@xml:id"/>
            <!-- Utilisation d'une variable s'appuyant sur l'identifiant des personnages -->
            <!-- Création d'une page html pour chaque personnage de la pièce, qui permettra de regrouper toutes les répliques propres à un personnage -->
            <!-- Le fichier xml ne regroupant pas toutes les scènes de la pièce, certains personnages auront une page xml ne comprenant aucunes répliques. -->
            <xsl:result-document href="{concat('out/','character_', $characterId, '.html')}"
                method="html" indent="yes">
                <html>
                    <xsl:copy-of select="$head"/>
                    <body style="margin: 1.5em 5em 5em 5em; font-family: 'Nunito'; font-size: 18px;">
                        <xsl:copy-of select="$navbar"/>
                        <h1 style="text-align: center; font-family: Lora;">
                            <xsl:value-of select="."/>
                        </h1>
                        <h3 style="text-align: center; margin-bottom: 6%; font-family: Lora;"
                            >Répliques</h3>
                        <!-- Boucle pour sélectionner les répliques des personnages -->
                        <xsl:for-each select="//sp[@who = concat('#', $characterId)]">
                            <p style="line-height: 2;">
                                <xsl:value-of
                                    select="concat(p, ' (Acte ', ancestor::div[@type = 'act']/@n, ', Scène ', ancestor::div[@type = 'scene']/@n, ')')"
                                />
                            </p>
                        </xsl:for-each>
                        <!-- Lien de retour vers la table des personnages -->
                        <p style="text-align: right; margin-top: 6%;">
                            <a style="font-weight: bold; color: #4184BF; text-decoration: none"
                                href="table.html">Retour à la table des personnages</a>
                        </p>
                    </body>
                    <xsl:copy-of select="$footer"/>
                </html>
            </xsl:result-document>
        </xsl:for-each>
    </xsl:template>

</xsl:stylesheet>
