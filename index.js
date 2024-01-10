const fs = require('fs');
const path = require('path');

const projectStructure = {
  src: ['controllers', 'models', 'routes'],
  config: ['database.js', 'env.js'],
  public: ['css', 'js', 'images'],
  tests: ['unit', 'integration'],
};

// Function to create directories recursively
function createDirectories(basePath, structure) {
  Object.keys(structure).forEach((folder) => {
    const folderPath = path.join(basePath, folder);

    // Check if the directory already exists
    if (!fs.existsSync(folderPath)) {
      fs.mkdirSync(folderPath);

      if (Array.isArray(structure[folder])) {
        structure[folder].forEach((file) => {
          const filePath = path.join(folderPath, file);
          fs.writeFileSync(filePath, '', 'utf-8');
          console.log(`Created file: ${filePath}`);
        });
      } else {
        createDirectories(folderPath, structure[folder]);
      }

      console.log(`Created directory: ${folderPath}`);
    } else {
      console.log(`Directory already exists: ${folderPath}`);
    }
  });
}

const rootDirectory = path.join(__dirname, 'MyProject');

// Create the project structure
createDirectories(rootDirectory, projectStructure);

console.log('Project structure created successfully!');
