//Question 1 : Write a program to copy the contents of a file named source.txt to a new file named 
//destination.txt. Check if the source file exists before copying. 

const fs = require('fs');
// Adding the content to the source txt to get copied to destination-txt
fs.appendFileSync('source-txt','how are you','utf-8');

// Check if source.txt exists
if (fs.existsSync('source-txt',)) {
    // Read the contents of source.txt
    const data = fs.readFileSync('source-txt', 'utf-8');

    // Write the data to destination.txt
    fs.writeFileSync('destination-txt', data);

    console.log("File copied successfully!");
} else {
    console.log("source-txt does not exist.");
}