#!/bin/bash

# AI Email Assistant Deployment Script
echo "🚀 Deploying AI Email Assistant to Cloudflare Workers..."

# Check if wrangler is installed
if ! command -v wrangler &> /dev/null; then
    echo "❌ Wrangler CLI not found. Please install it first:"
    echo "npm install -g wrangler"
    exit 1
fi

# Navigate to worker directory
cd worker-email-ai

# Check if user is logged in
if ! wrangler whoami &> /dev/null; then
    echo "🔐 Please log in to Cloudflare first:"
    wrangler login
fi

# Install dependencies
echo "📦 Installing dependencies..."
npm install

# Deploy the worker
echo "🚀 Deploying to Cloudflare Workers..."
wrangler deploy

echo "✅ Deployment complete!"
echo "🌐 Your AI Email Assistant is now live!"
echo "📖 Check the README.md for usage instructions."
