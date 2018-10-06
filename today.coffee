command: "echo $(~/widgets/lemonic.widget/lib/sysmon today)"

refreshFrequency: 10000

render: (output) -> """
    <div class="date">
        <span class="text">#{output}</span>
    </div>
"""

style: """
    font 12px LiterationMono Nerd Font Mono
    bottom 4px
    text-align left
    right 75px
    width 75px
    color #d381c3
    .text
        color inherit
"""
