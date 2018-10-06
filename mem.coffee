command: "echo $(~/widgets/lemonic.widget/lib/sysmon mem)"

refreshFrequency: '1s'

render: () -> """
    <div class="memory">
        <span class="icon">\uf538</span>
        <span class="pmem text"></span>
    </div>
    """

style: """
    font 12px LiterationMono Nerd Font Mono
    bottom 4px
    right 230px
    width 60px
    text-align left
    color @color
    .icon
        font 12px FontAwesome5FreeSolid
        color #D5C4A1
    .text
        color: inherit
    """

update: (output, domE1) ->
    green = "#a1c659"
    red = "#fb0120"
    orange = "#fc6d24"
    yellow = "#fda331"
    div = $(domE1)
    color = switch
        when output < 15 then green
        when output < 30 then yellow
        when output < 75 then orange
        else red
    div.css color: color
    div.find('.pmem').html(output)
