//Muscles are always referenced in code in the singular form, and in lower camelcase.
// E.g. bicep, not biceps. 

enum Muscles {
  upperChest('Upper Chest'),
  midChest('Mid Chest'),
  lowerChest('Lower Chest'),
  frontDelt('Front Delt'),
  sideDelt('Side Delt'),
  rearDelt('Rear Delt'),
  bicep('Biceps'),
  forearmFlexor('Forearm Flexors'),
  forearmExtensor('Forearm Extensors'),
  oblique('Obliques'),
  ab('Abs'),
  hipAbductor('Hip Abductors'),
  hipAdductor('Hip Adductors'),
  quad('Quads'),
  trap('Traps'),
  lat('Lats'),
  lowerBack('Lower Back'),
  glute('Glutes'),
  hamstring('Hamstrings'),
  calf('Calves')
  ;
  
  final String value;
  const Muscles(this.value);
  }