command: "osascript 'lemonic.widget/lib/Get Current Track.applescript'"
refreshFrequency: '1s'

render: () -> """
    <div class="spotify">
    <span class="progress"></span>
    <span class="song text"></span> <span class="icon">\uf001</span> <span class="artist text"></span>
    </div>
    """

style: """
    font 12px Hack Nerd Font Mono
    color #1ED780
    bottom: 4px
    left: 10px
    width: 100%
    .icon
        font 12px FontAwesome5FreeSolid
        color #D5C4A1
    .label
        color #D5C4A1
    .text
        color inherit
    .progress
        background-color #222222
        position absolute
        width @width
        bottom 0px
        height 2px
    """

update: (output, domE1) ->
    div = $(domE1)
    if !output
        div.hide(1)
    else
        values = output.slice(0, -1).split(" @ ")
        div.find('.artist').html(values[0])
        div.find('.song').html(values[1])
        tDuration = values[3]
        tPosition = values[4]
        songChanged = values[6]
        tWidth = div.width()
        tCurrent = (tPosition / tDuration) * tWidth
        div.find('.progress').css width: tCurrent
        div.show(1)
