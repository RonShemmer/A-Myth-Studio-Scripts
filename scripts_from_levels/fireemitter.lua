local part = script.Parent

local fire = Instance.new("Fire")
fire.Parent = part

fire.Size = 5 -- The size of the fire
fire.Heat = 10 -- The amount of heat the fire generates
fire.Color = Color3.fromRGB(255, 10, 100) -- The color of the fire particles
fire.SecondaryColor = Color3.fromRGB(255, 153, 0) -- The secondary color of the fire particles

local emitter = Instance.new("ParticleEmitter")
emitter.Parent = fire

emitter.Enabled = true -- Start emitting particles
emitter.Texture = "rbxassetid://243620121" -- The texture of the particles
emitter.Lifetime = NumberRange.new(1, 2) -- The range of time that the particles will last
emitter.Size = NumberSequence.new(1, 2) -- The size of the particles
emitter.Acceleration = Vector3.new(0, 10, 0) -- The acceleration of the particles
emitter.Rate = 50 -- The rate at which particles are emitted
