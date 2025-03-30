# macos-config
this is my list of macos apps and settings that are required to make macos work well with my (or any productive persons) workflow.

![pic of my desktop](screenshot.png)

| last updated     |
| ---------------- |
| march 30th, 2025 |

## table of contents

- [macos-config](#macos-config)
  - [table of contents](#table-of-contents)
  - [basic configuration](#basic-configuration)
  - [full list of apps](#full-list-of-apps)
  - [fonts](#fonts)
  - [vscode](#vscode)
  - [chrome](#chrome)
  - [iterm2](#iterm2)
  - [useful extras](#useful-extras)

## basic configuration
you will need [chrome](https://www.google.com/chrome/), and [rectangle](https://github.com/rxhanson/Rectangle). these are necessities.

next, i always hide the dock automatticaly because its wasted screen space. the animation to show is super slow though so use this command to make the animation faster.

```bash
defaults write com.apple.dock autohide-time-modifier -float 0.15; killall Dock
```

the current wallpaper i am using is a gradient found [here](wallpapers/cappuccin/gradients/bkg3_bkg5.png).

## full list of apps

[bartender](https://www.macbartender.com/Bartender5/) - hide elements on menu bar
```brew install bartender```

[chrome](https://www.google.com/chrome/) - web browser
```brew install google-chrome```

[iterm2](https://github.com/gnachman/iTerm2) - better terminal (terminal.app has weak color support) 
```brew install iterm2```

[karabiner-elements](https://github.com/pqrs-org/Karabiner-Elements) - keyboard remaps (remap f3 => launchpad)
```brew install karabiner-elemets```

[monitorcontrol](https://github.com/MonitorControl/MonitorControl) - dim external displays
```brew install monitorcontrol```

[mpv](https://github.com/mpv-player/mpv) - great video player
```brew install mpv```

[oh-my-zsh](https://github.com/ohmyzsh/ohmyzsh) - easy terminal customization ([my config](zsh/.zshrc))

[pyenv](https://github.com/pyenv/pyenv?tab=readme-ov-file#macos) - python version control because macos ships with outdated python
```brew install pyenv```

[rectangle](https://github.com/rxhanson/Rectangle) - window snapping + keybinds
```brew install rectangle```

[scroll-reverser](https://github.com/pilotmoon/Scroll-Reverser) - reverses scrolling on macos
```brew install scroll-reverser```

[spaceid](https://github.com/dshnkao/SpaceId) - show which space you are in on the menu bar
```brew install spaceid```

[vscode](https://code.visualstudio.com/) - my code editor of choice
```brew install visual-studio-code```

## fonts 

i use the [ubuntu font](https://design.ubuntu.com/font), more specifically [ubuntu mono](https://fonts.google.com/specimen/Ubuntu+Mono) for all my terminal and vs-code stuff.

## vscode
i would use neovim, or really anything else if getting a LSP to work was not such a pain. 

color-theme: [catppuccin for vscode - frappé](https://marketplace.visualstudio.com/items?itemName=Catppuccin.catppuccin-vsc)

icon-theme: [vscode-icons](https://marketplace.visualstudio.com/items?itemName=vscode-icons-team.vscode-icons) 

my settings.json file is located [here](/vscode/settings.json)

*i would recommend turning on cursor smooth caret animation, it looks really nice, especially on a high refresh rate screen*

extensions
1. [vim](https://marketplace.visualstudio.com/items?itemName=vscodevim.vim) - i set the status bar color control to true so it is more obvious what mode i am in. also turn on relative line numbers, its very helpful.
2. [php extention pack](https://marketplace.visualstudio.com/items?itemName=xdebug.php-pack) - very useful for developing php apps. built in web server and code completion.
3. [extension pack for java](https://marketplace.visualstudio.com/items?itemName=vscjava.vscode-java-pack) - also very useful for developing java apps. couldnt use vscode without it.

## chrome 
i used to only use firefox because google dosent need any more control over my life. i gave up.
ungoogled-chromium was too much work to make work, so i just use chorom. it does what i need it to do and nothing more.

theme: [catppuccin chrome theme - frappe](https://chromewebstore.google.com/detail/catppuccin-chrome-theme-f/olhelnoplefjdmncknfphenjclimckaf)

extentions
1. [ublock](https://chromewebstore.google.com/detail/ublock/epcnnfbjfcgphgdmggkamkmgojdagdnn) - okayish ad blocker.
2. [vimium](https://vimium.github.io/) - best thing ever made. 

## iterm2
not much to say here. i used [this color preset](iterm2/catppuccin-frappe.itermcolors) and [this profile](iterm2/Default.json)

## useful extras

This command will reset your launchpad. In sequoia the old one does not work. This came in handy for me.
```bash
sudo find 2>/dev/null /private/var/folders/ -type d -name com.apple.dock.launchpad -exec rm -rf {} +; killall Dock
```

This command will delete all .DS_Store files recursively
```bash
find . -name ".DS_Store" -delete
```