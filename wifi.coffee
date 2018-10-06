command: "echo $(~/widgets/lemonic.widget/lib/sysmon wifi)"

refreshFrequency: 10000

render: () -> """
    <div class="wifi">
        <span class="icon">\uf1eb</span>
        <span class="ssid text"></span>
    </div>
    """

style: """
    font 12px LiterationMono Nerd Font Mono
    bottom 4px
    right 360px
    width auto
    text-align right
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
    color = switch
        when values[1] > -50 then green
        when values[1] < -100 then red
        else orange

    div.css color: color
    div.find('.ssid').html(values[0])
