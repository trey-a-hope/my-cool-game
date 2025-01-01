# My Cool Game

A 2D RPG/Fantasy game built with Flutter and Flame engine, featuring pixel art graphics, combat mechanics, and immersive world design. This project follows the comprehensive development approach from "On Fire with Bonfire" game development course.

<img width="2240" alt="Screenshot 2025-01-01 at 11 14 05 AM" src="https://github.com/user-attachments/assets/51f4490f-3d87-466e-a5d3-93395a079cac" />

## 🎮 Features

- Complete combat system with enemies and attacks
- Fluid character movement and physics-based interactions
- Main hero and allies system with rich characterization
- World design with parallax backgrounds and dynamic lighting
- Item and inventory management
- Dialogue and storytelling system
- Comprehensive audio and visual effects
- Game state management
- Performance-optimized gameplay

## 🚀 Project Development Phases

1. **Project Setup & Map Design with Sprite Fusion**
   - Create Map in Sprite Fusion
   - Display New Map in Flutter

2. **Building The Main Hero & NPC Components**
   - Add NPC Markers to the Map
   - Create the Dwarf Warrior Player
   - Create the Alchemist NPC
   - Create the Blacksmith NPC

3. **Applying Input Handling & Collision Detection**
   - Creating and Applying Gravity to Player Movement
   - Setting Up Collision Detection for Players and NPCs
   - Apply Joystick Movement to Player
   - Add Jump Ability to Player
   - Implementing a Pause Feature
   - Implementing Action Button Controls for Players
   - Add Mouse Event Listener to Player
   - Keep Player Inside Screen Boundaries

4. **Building a Combat System via Enemies & Attacks**
   - Adding Enemies to the Map
   - Adding Combat Animations for the Dwarf Warrior
   - Creating the LizardMan Enemy
   - Adding Life Bars to Players and Enemies
   - Implementing the Dwarf Warrior's Melee Attack
   - Implementing Damage Handling for the Lizardman
   - Implementing LizardMan's Attack System
   - Handling the Dwarf Warrior's Damage Reception
   - Create the Minotaur and Headless Horseman from the LizardMan Template

5. **Producing World Design via Lighting & Objects**
   - Build a Parallax Background
   - Create Non-Interactive Plant Objects
   - Create Non-Interactive World Objects
   - Create Interactive Chest Object
   - Create Sensor & Lighting Bonfire Object
  
6. **Generating Pickup Items for Inventory System**
   - Architect the Inventory System
   - Create Droppable Items
   - Create and Display the Inventory Interfac
   - Add Items to Inventory
   - Use and Manage Inventory Items

7. **Crafting Dialogue Systems & Rich Storytelling**
   - Create Game Over & Game Won Overlays
   - Create the Two Items For the story
   - Create the Game Progress Notifier
   - Create Conversation For the Alchemist
   - Create Conversation For the Blacksmith
   - Update Game State During Progression
  
8. **Adding Audio Integration & Visual Effects**
   - Create Notifier for Audio Settings
   - Add Sound Effects to Game Components
   - Create an Audio Settings Overlay
   - Create a Custom Text Widget
   - Create Start Menu Overlay
     
5. **Finalizing with Cleanup and App Deployment**
   - Add Component Update Skip Checks
   - Applying Stronger Gravity to Enemies
   - Handling ParallaxBackground Resizing
   - Creating Widget, Unit, and Integration Tests
   - Deploying Your App to the Web with Render

## 🚀 Getting Started

### Prerequisites

- Flutter SDK (2.0.0 or higher)
- Dart SDK (2.12.0 or higher)
- Basic understanding of Flutter and Flame engine

### Installation

1. Clone the repository
```bash
git clone https://github.com/yourusername/my-cool-game.git
```

2. Navigate to project directory
```bash
cd my-cool-game
```

3. Install dependencies
```bash
flutter pub get
```

4. Run the app
```bash
flutter run
```

## 📱 Supported Platforms

- Android
- iOS
- Web
- Windows
- macOS
- Linux

## 🛠️ Built With

- [Flutter](https://flutter.dev/) - UI framework
- [Flame](https://flame-engine.org/) - Game engine
- [Bonfire](https://bonfire-engine.github.io/) - RPG game engine extension
- [Audioplayers](https://pub.dev/packages/audioplayers) - Audio handling
- [Shared Preferences](https://pub.dev/packages/shared_preferences) - Local storage

## 🧪 Testing

Run tests using:
```bash
flutter test
```

## 📝 License

This project is licensed under the MIT License - see the [LICENSE.md](LICENSE.md) file for details.

## 🤝 Contributing

1. Fork the Project
2. Create your Feature Branch (`git checkout -b feature/AmazingFeature`)
3. Commit your Changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the Branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

## ✨ Acknowledgments

- Original course: "On Fire with Bonfire: My Cool Game"
- Special thanks to the Flutter and Flame communities

---
*Made with ❤️ using Flutter, Flame, and Bonfire*
