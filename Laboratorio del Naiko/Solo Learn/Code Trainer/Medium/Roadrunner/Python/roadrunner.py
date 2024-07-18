#  **Roadrunner Challenge**
# 
# A coyote is chasing a roadrunner, and they start out 50 feet apart. If you know how fast they are
# both traveling and how far the roadrunner is from safety, determine whether or not the coyote is able
# to catch the roadrunner. Both animals and the roadrunner's safe place are on a straight line.
# 
#  **Task:**
# Determine whether or not the roadrunner made it to safety.
# 
#  **Input Format:**
# Three integer values:
# 1. The distance the roadrunner is from safety.
# 2. The roadrunner's speed (feet/second).
# 3. The coyote's speed (feet/second).
# 
#  **Output Format:**
# A string that says 'Meep Meep' if the roadrunner made it, or 'Yum' if the coyote caught up to the roadrunner.
# 
#  **Sample Input:**
# 	10
# 	5
# 	20
# 
#  **Sample Output:**
# 	Meep Meep

def getTime(finalPosition, initialPosition, velocity):
    time = (finalPosition - initialPosition)/velocity
    return time

def getFinalPosition(initialPosition, velocity, acceleration, time):
    finalPosition = initialPosition + (velocity*time) + (acceleration * time**2 /2)
    return finalPosition

startingDistance = int(50)
safetyDistance = int(input())
roadrunnerVelocity = int(input())
coyoteVelocity = int(input())

roadrunnerTime = int()
coyoteFinalPosition = int()

roadrunnerTime = getTime(safetyDistance+startingDistance, roadrunnerVelocity, startingDistance)
coyoteFinalPosition = getFinalPosition(0, coyoteVelocity, 0, roadrunnerTime)

print(roadrunnerTime)
print(coyoteFinalPosition)

if (coyoteFinalPosition >= safetyDistance+startingDistance):
    print("Yum")
else:
    print("Meep Meep")
