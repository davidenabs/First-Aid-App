

import 'package:first_aid_app/models/injury.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FirstAidController extends GetxController {
  final majorInjuries = <Injury>[
    Injury(
      id: 'heart_attack',
      name: 'Heart Attack',
      description: 'Sudden blockage of blood flow to the heart muscle.',
      symptoms: [
        'Chest pain or discomfort',
        'Shortness of breath',
        'Nausea or vomiting',
        'Cold sweats',
        'Pain in arms, neck, jaw, or back'
      ],
      firstAidSteps: [
        'Call emergency services immediately (911 or local emergency number)',
        'Help the person sit down and rest',
        'If available, give aspirin (unless allergic)',
        'Loosen tight clothing around neck and chest',
        'Monitor breathing and pulse, be ready to perform CPR'
      ],
      warnings: 'Do not leave the person alone. If unconscious, begin CPR immediately.',
      icon: Icons.favorite,
    ),
    Injury(
      id: 'severe_bleeding',
      name: 'Severe Bleeding',
      description: 'Heavy blood loss that requires immediate attention.',
      symptoms: [
        'Profuse bleeding',
        'Blood soaking through bandages',
        'Weakness or dizziness',
        'Pale, cold, clammy skin',
        'Rapid pulse'
      ],
      firstAidSteps: [
        'Apply direct pressure to the wound with a clean cloth',
        'Elevate the injured area above heart level if possible',
        'Apply pressure bandage if bleeding continues',
        'Call emergency services immediately',
        'Monitor for shock symptoms'
      ],
      warnings: 'Do not remove objects embedded in wounds. Control bleeding around them.',
      icon: Icons.bloodtype,
    ),
    Injury(
      id: 'choking',
      name: 'Choking',
      description: 'Blocked airway preventing normal breathing.',
      symptoms: [
        'Cannot speak or cough',
        'Difficulty breathing',
        'Blue lips or face',
        'Hands clutching throat',
        'Panic or distress'
      ],
      firstAidSteps: [
        'Encourage coughing if person can still cough',
        'Perform 5 back blows between shoulder blades',
        'If unsuccessful, perform 5 abdominal thrusts (Heimlich maneuver)',
        'Alternate between back blows and abdominal thrusts',
        'Call emergency services if object not dislodged'
      ],
      warnings: 'For infants under 1 year, use back blows and chest thrusts only.',
      icon: Icons.air,
    ),
    Injury(
      id: 'stroke',
      name: 'Stroke',
      description: 'Sudden loss of brain function due to blood flow disruption.',
      symptoms: [
        'Face drooping on one side',
        'Arm weakness',
        'Speech difficulties',
        'Sudden confusion',
        'Severe headache'
      ],
      firstAidSteps: [
        'Call emergency services immediately',
        'Note the time symptoms started',
        'Help person lie down with head slightly elevated',
        'Loosen tight clothing',
        'Do not give food or water'
      ],
      warnings: 'Time is critical. Every minute counts in stroke treatment.',
      icon: Icons.psychology,
    ),
    Injury(
      id: 'fractures',
      name: 'Fractures',
      description: 'Broken or cracked bones requiring immediate care.',
      symptoms: [
        'Severe pain',
        'Swelling and bruising',
        'Deformity or abnormal position',
        'Unable to use or move area',
        'Bone visible through skin'
      ],
      firstAidSteps: [
        'Do not move the injured area',
        'Immobilize with splint if trained',
        'Apply ice wrapped in cloth',
        'Control any bleeding',
        'Call emergency services for severe fractures'
      ],
      warnings: 'Do not attempt to realign bones or push them back if protruding.',
      icon: Icons.healing,
    ),
  ].obs;

  final minorInjuries = <Injury>[
    Injury(
      id: 'minor_cuts',
      name: 'Minor Cuts',
      description: 'Small wounds that break the skin surface.',
      symptoms: [
        'Bleeding',
        'Pain at wound site',
        'Torn or broken skin',
        'Minor swelling'
      ],
      firstAidSteps: [
        'Clean your hands before treating',
        'Stop bleeding by applying gentle pressure',
        'Clean wound with water',
        'Apply antibiotic ointment if available',
        'Cover with sterile bandage'
      ],
      warnings: 'Seek medical attention if wound is deep, gaping, or shows signs of infection.',
      icon: Icons.cut,
    ),
    Injury(
      id: 'minor_burns',
      name: 'Minor Burns',
      description: 'First-degree burns affecting only outer skin layer.',
      symptoms: [
        'Red skin',
        'Pain',
        'Minor swelling',
        'No blisters'
      ],
      firstAidSteps: [
        'Cool burn with cold running water for 10-15 minutes',
        'Remove jewelry near burned area',
        'Apply aloe vera or moisturizer',
        'Take over-the-counter pain reliever',
        'Cover with sterile gauze if needed'
      ],
      warnings: 'Do not use ice, butter, or oil on burns. Seek medical care for burns larger than palm size.',
      icon: Icons.local_fire_department,
    ),
    Injury(
      id: 'sprains',
      name: 'Sprains',
      description: 'Stretched or torn ligaments around joints.',
      symptoms: [
        'Pain',
        'Swelling',
        'Bruising',
        'Limited movement',
        'Joint instability'
      ],
      firstAidSteps: [
        'Rest the injured area',
        'Apply ice for 15-20 minutes',
        'Compress with elastic bandage',
        'Elevate injured area above heart level',
        'Take anti-inflammatory medication'
      ],
      warnings: 'Use RICE method: Rest, Ice, Compression, Elevation. Seek medical care if severe.',
      icon: Icons.sports_handball,
    ),
    Injury(
      id: 'insect_bites',
      name: 'Insect Bites',
      description: 'Reactions to insect stings or bites.',
      symptoms: [
        'Redness',
        'Swelling',
        'Itching',
        'Pain or burning',
        'Small bump or welt'
      ],
      firstAidSteps: [
        'Remove stinger if visible (scrape, do not pinch)',
        'Wash area with soap and water',
        'Apply cold compress',
        'Use antihistamine for itching',
        'Apply topical anti-itch cream'
      ],
      warnings: 'Seek immediate medical care for signs of severe allergic reaction.',
      icon: Icons.bug_report,
    ),
    Injury(
      id: 'nosebleeds',
      name: 'Nosebleeds',
      description: 'Bleeding from the nose, usually from front part.',
      symptoms: [
        'Blood from nose',
        'Metallic taste in mouth',
        'Blood running down throat'
      ],
      firstAidSteps: [
        'Sit upright and lean slightly forward',
        'Pinch soft part of nose firmly',
        'Hold for 10-15 minutes without checking',
        'Apply cold compress to nose bridge',
        'Avoid blowing nose for several hours'
      ],
      warnings: 'Seek medical care if bleeding continues after 20 minutes or follows head injury.',
      icon: Icons.face,
    ),
  ].obs;

  Injury? selectedInjury;

  void selectInjury(Injury injury) {
    selectedInjury = injury;
  }
}