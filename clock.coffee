command: "echo $(~/widgets/lemonic.widget/lib/sysmon clock)"

refreshFrequency: '1s'

render: (output) -> """
    <div class="time">
        <span class="text">#{output}</span>
    </div>
"""

style: """
    font 12px LiterationMono Nerd Font Mono
    bottom 4px
    right 10px
    text-align left
    width 55px
    color #6fb3d2
    .text
        color inherit
"""
