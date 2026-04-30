1..30 | ForEach-Object {

    $day = $_

    1..3 | ForEach-Object {

        $hour = Get-Random -Minimum 10 -Maximum 22

        $commitDate = (Get-Date "2026-04-01").AddDays($day - 1).AddHours($hour).ToString("yyyy-MM-dd HH:mm:ss")

        $env:GIT_AUTHOR_DATE = $commitDate
        $env:GIT_COMMITTER_DATE = $commitDate

        Add-Content activity.txt "Contribution Day $day"

        git add .
        git commit -m "Update day $day"
    }
}