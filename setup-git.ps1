# Initialize git repository
Write-Host "Initializing git repository..."
git init

# Add all files
Write-Host "Adding files..."
git add .

# Configure git user
Write-Host "Configuring git user..."
git config user.name "satyamwagh968"
git config user.email "satyamwagh968@example.com"

# Create initial commit
Write-Host "Creating initial commit..."
git commit -m "Initial Calculator commit"

# Set remote to GitHub
Write-Host "Setting remote origin..."
git remote add origin https://github.com/satyamwagh968/Calculator-master.git

# Rename main branch if needed
Write-Host "Renaming branch to main..."
git branch -M main

# Push to GitHub
Write-Host "Pushing to GitHub..."
git push -u origin main

Write-Host "Done! Repository uploaded to GitHub."