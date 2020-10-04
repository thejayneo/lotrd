module Events
    def town
        town_events_list = [
            "You see the villagers quietly going about their day as a few adventurers gather around the leaderboard.",
            "From the colourful stalls, it seems like the merchant is in town. Maybe the food at the inn will taste better tonight...",
            "A heavy fog hangs over town and the main street is eerily quiet...",
            "Rain pours endlessly from the sky above and villagers dash for cover",
            "The sun peeks from behind the clouds, and a ray of light illuminates the face of a stunning adventurer you never met before..."
        ]
        town_events_list[rand(0..4)]
    end

    def adventure
        adventure_events_list = [
            "A rabbit bounds off before you can catch it. You finish your patrol uneventfully.",
            "A merchant with his wagon can be seen. He asks you for directions to Hazelwood and then you go your seperate ways.",
            "You find nothing... but you were certain you heard something...",
            "Just another squirrel...",
            "You see something shiny on the ground... as you look closer you realise it's just a distraction. Whoever was here has gotten away."
        ]
        adventure_events_list[rand(0..4)]
    end
    module_function :adventure, :town
end