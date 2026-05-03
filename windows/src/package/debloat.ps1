$Bloatware = @(
    "Microsoft.BingNews",
    "Microsoft.BingWeather",
    "Microsoft.GetHelp",
    "Microsoft.Getstarted",
    "Microsoft.MicrosoftOfficeHub",
    "Microsoft.MicrosoftSolitaireCollection",
    "Microsoft.People",
    "Microsoft.Todos",
    "Microsoft.WindowsFeedbackHub",
    "Microsoft.YourPhone",
    "Microsoft.ZuneMusic",
    "Microsoft.ZuneVideo",
    "MicrosoftTeams",
    "Clipchamp.Clipchamp",
    "Microsoft.PowerAutomateDesktop",
    "Microsoft.BingSearch",
    "Microsoft.Xbox.TCUI",
    "Microsoft.XboxApp",
    "Microsoft.XboxGameOverlay",
    "Microsoft.XboxGamingOverlay",
    "Microsoft.XboxIdentityProvider",
    "Microsoft.XboxSpeechToTextOverlay",
    "Microsoft.GamingApp",
    "Microsoft.MixedReality.Portal",
    "Microsoft.SkypeApp",
    "Microsoft.Whiteboard",
    "Microsoft.WindowsMaps",
    "Microsoft.WindowsSoundRecorder",
    "Microsoft.549981C3F5F10", # Cortana
    "Microsoft.WindowsCommunicationsApps",
    "SpotifyAB.SpotifyMusic",
    "Disney.37853D22215B2",
    "king.com.CandyCrushSaga",
    "king.com.CandyCrushFriends",
    "Facebook.Facebook",
    "Amazon.com.Amazon",
    "BytedanceInc.TikTok",
    "Duolingo-LearnLanguagesforFree",
    "PricelinePartnerNetwork.Booking.comBigsavingsonhot",
    "AdobeSystemsIncorporated.AdobePhotoshopExpress"
    "Microsoft.3DBuilder",
    "Microsoft.Print3D",
    "Microsoft.MSPaint",
    "Microsoft.Office.OneNote",
    "Microsoft.OneConnect",
    "Microsoft.StorePurchaseApp",
    "Microsoft.Wallet",
    "Microsoft.BingFinance",
    "Microsoft.BingSports",
    "Microsoft.BingFoodAndDrink",
    "Microsoft.BingHealthAndFitness",
    "Microsoft.BingTravel",
    "Microsoft.Advertising.Xaml",
    "Microsoft.MicrosoftJournal",
    "Microsoft.Windows.DevHome"
)

function Debloat-Windows() {
    foreach ($item in $Bloatware) {
        Write-Host -NoNewline `
        "$Bold${Blue}Debloat: ${White}removing ${Blue}item"
        winget uninstall `
        --id $item --exact --silent --accept-source-agreements | Out-Null
        Write-Host "$Bold$Green✔$Reset"
    }
}
