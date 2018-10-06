command: "echo $(~/widgets/lemonic.widget/lib/sysmon cpu)"

refreshFrequency: '1s'

render: () -> """
    <div class="cpu">
        <span class="icon">\uf2db</span>
        <span class="pcpu text"></span>
    </div>
    """

style: """
    font 12px LiterationMono Nerd Font Mono
    bottom 4px
    text-align left
    right 160px
    width 60px
    color @color
    .icon
        font 12px FontAwesome5FreeSolid
        color #D5C4A1
    .text
        color: inherit
    """

update: (output, domE1) ->
    green  = "#a1c659"
    red = "#fb0120"
    orange = "#fc6d24"
    yellow = "#fda331"
    div = $(domE1)
    color = switch
        when output < 15 then green
        when output < 30 then yellow
        when output < 60 then orange
        else red
    div.css color: color
    div.find('.pcpu').html(output)
