<script>
        const list1 = [
            "Churn",
            "Spread Thin",
            "Sizzle",
            "Creamy",
            "Milky",
            "Whipped",
            "Smooth",
            "Melted",
            "Slick",
            "Softened",
            "Salted",
            "Cultured",
            "Golden",
            "Rich",
            "Foamy",
            "Toasty",
            "Bubbly",
            "Glossy",
            "Frothy",
            "Sweetened",
            "Savory",
            "Clarified",
            "Stuttery",
            "Golden Brown",
            "Caramelized",
            "Toasted",
            "Drizzle",
            "Ghee",
            "Velvety",
            "Nutty",
            "Lush",
            "Lathered",
            "Creamed",
            "Melt-in-your-mouth",
            "Pat",
            "Glossed",
            "Spreadable",
            "Creamy-rich",
            "Silken",
            "Fat",
            "Crumbly",
            "Silky"
        ];

        const list2 = [
    "Studio",
    "Agency",
    "Collective",
    "Co.",
    "Films",
    "Partners",
    "Works",
    "Creatives",
    "Lab",
    "Productions",
    "Ideas",
    "Group",
    "Innovations",
    "House",
    "Office",
    "Type",
    "Studios",
    "Inc"
];


        let generationCount = 0;

        document.getElementById("generate-button").addEventListener("click", function() {
            generateName();
        });

        document.getElementById("dislike-button").addEventListener("click", function() {
            generateName();
        });

        function generateName() {
            // Increment generation count
            generationCount++;

            // Clear previous name
            const nameBox = document.getElementById("name-box");

            if (generationCount % 10 === 0) {
                nameBox.textContent = "You are a hard nut to crack...";
                return;
            }

            // Show loading animation
            nameBox.innerHTML = 'Churning Butter back into milk<span id="loading-dots"></span>';

            // Wait for 1 second before showing the generated name
            setTimeout(() => {
                // Randomly decide if it will use only one word from list1 or combine from both lists
                const useSingleWord = Math.random() < 0.1; // 10% chance to use only one word
                let generatedName;

                if (useSingleWord) {
                    const randomIndex1 = Math.floor(Math.random() * list1.length);
                    generatedName = list1[randomIndex1];
                } else {
                    const randomIndex1 = Math.floor(Math.random() * list1.length);
                    const randomIndex2 = Math.floor(Math.random() * list2.length);
                    generatedName = `${list1[randomIndex1]} ${list2[randomIndex2]}`;
                }

                // Display the generated name
                nameBox.textContent = generatedName;

                // Show the feedback box
                document.getElementById("feedback-box").style.display = "flex";
            }, 3000);
        }

        window.addEventListener('click', function startAudio() {
    // Play background music in a loop
    const music = document.getElementById("music");
    music.play().catch((e) => {
        console.error('Music playback failed: ', e);
    });

    // Play welcome sound once
    const welcome = document.getElementById("welcome");
    welcome.play().catch((e) => {
        console.error('Welcome sound playback failed: ', e);
    });

    // Remove this event listener so the sounds only play once
    window.removeEventListener('click', startAudio);
});

        document.getElementById("generate-button").addEventListener("click", function() {
            // Play click sound
            const clickSound = document.getElementById("click");
            clickSound.play();

            generateName();
        });
        document.getElementById("like-button").addEventListener("click", function() {
            const nameBox = document.getElementById("name-box");
            nameBox.textContent = `Congratulations on your new name: ${nameBox.textContent}`;
            document.getElementById("feedback-box").style.display = "none";

            // Play WIN sound
            const winSound = document.getElementById("win");
            winSound.play();

            // Randomly play one of the like sounds
            const likeSounds = [document.getElementById("like1"), document.getElementById("like2")];
            const randomLike = likeSounds[Math.floor(Math.random() * likeSounds.length)];
            randomLike.play();
        });

        document.getElementById("dislike-button").addEventListener("click", function() {
            // Randomly play one of the dislike sounds
            const dislikeSounds = [document.getElementById("dislike1"), document.getElementById("dislike2")];
            const randomDislike = dislikeSounds[Math.floor(Math.random() * dislikeSounds.length)];
            randomDislike.play();

            generateName();
        });

</script>
