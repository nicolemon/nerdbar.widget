command: "echo $(~/widgets/lemonic.widget/lib/sysmon battery)"

refreshFrequency: 150000 # ms

render: () -> """
    <div class="battery">
        <span class="icon"></span>
        <span class="charge text"></span>
    </div>
    """

style: """
    font 12px LiterationMono Nerd Font Mono
    bottom 4px
    right 300px
    width 50px
    text-align left
    color @color
    .icon
        font 12px FontAwesome5FreeSolid
        color #D5C4A1
    .text
        color inherit
    """

update: (output, domE1) ->
    green = "#a1c659"
    red = "#fb0120"
    orange = "#fc6d24"
    yellow = "#fda331"

    div = $(domE1)
    values = output.split(" @ ")
    if values[0] is "charged"
        icon = "\uf1e6"
    else if values[0] is "charging"
        icon = "\uf0e7"
    else if values[0] is "discharging"
        icon = switch
            when values[1] <= 5 then "\uf244"
            when values[1] <= 25 then "\uf243"
            when values[1] <= 50 then "\uf242"
            when values[1] <= 75 then "\uf241"
            when values[1] <= 100 then "\uf240"
            else "\uf0e7"
    else "\uf0e7"

    color = switch
        when values[1] <= 15 then red
        when values[1] <= 50 then orange
        when values[1] <= 85 then yellow
        when values[1] <= 90 then green
        when values[1] <= 100 then green
        else "#808080"

    div.css color: color
    div.find('.icon').html(icon)
    div.find('.charge').html(values[1])
