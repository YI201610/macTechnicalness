# 1 Introducing Auto Layout
    序文 - 

    Origins

    Saying “Yes” to Auto Layout
        Geometric Relationships 
        Content-Driven Layout
        Prioritized Rules
        Inspection and Modularization
        Incremental Adoption

    Constraints
        Satisfiability
        Sufficiency

    Constraint Attributes

    About Those Missing Views
        Underconstrained Missing Views
        Missing Views with Inconsistent Rules
        Tracking Missing Views
    
    Ambiguous Layout
        Exercising Ambiguity
        Visualizing Constraints

    Intrinsic Content Size

    Compression Resistance and Content Hugging
    
    Image Embellishments
        Alignment Rectangles
        Visualizing Alignment Rectangles
        Alignment Insets
        Declaring Alignment Rectangles
        Implementing Alignment Rectangles

    Exercises

    Conclusions




# 2 Constraints
    Constraint Types 31 

    Priorities 33
        Conflicting Priorities 33
        Enumerated Priorities 34 

    Content Size Constraints 36
        Intrinsic Content Size 36
        Content Hugging 36
        Compression Resistance 38
        Setting Content Size Constraints in Code 39 
        Setting Content Size Constraints in IB 40

    Building Layout Constraints 41 

    The Layout Constraint Class 42
        Constraint Math 42
        First and Second Items 43 

    Creating Layout Constraints 44
        Building NSLayoutConstraint Instances 
        Unary Constraints 45
        Zero-Item Constraints Are Illegal 46
    
    View Items 47

    Constraints, Hierarchies, and Bounds Systems 48 

    Installing Constraints 50
        Removing Constraints 52

    Comparing Constraints 54
        Matching Constraints 55 

    Laws of Layout Constraints 57 

    Exercises 59

    Conclusions 59


# 3 Interface Builder Layout 61
    Designing in IB 61
    Disabling Auto Layout 62
        Opting Out of Auto Layout in Code 63
        Combining Autosizing with Auto Layout 64

    Basic Layout and Auto-Generated Constraints 64
        Inferred Constraints 64
        Ambiguity Resolution Constraints 67 
        Size Constraints 69

    A Guided Tour of IB Elements 69 
        Constraint Listings 76
        Xcode Labels 78
        Adding Xcode Identities 79

    Adding Constraints 80 
        Dragging 81
        Pinning and Aligning 83

    Previewing Layouts 85 

    Inspecting Constraints 88 

    View Size Inspector 90
        Frame and Layout Rectangles 91
        Other Size Inspector Items 92 

    The Resolution Menu 92
        Updating Frames and Constraints 92 
        Adding and Resetting Constraints 93 
        Clearing Constraints 93

    Constraints/Resizing Pop-Up Menu 93 
        Descendants 94
        Siblings and Ancestors 95

    The Missing Views Problem 95 

    Balancing Requests 97

    Hybrid Layout 100
        Building a Nib File for Testing 100
        Adding the Nib File in Code 101 
        Advantages of Hybrid Layout 102

    Removing IB-Generated Constraints 104 
  
    Exercises 105
    
    Conclusions 108



# 4 Visual Formats 109
    Introducing Visual Format Constraints 
    
    Options 111
        Alignment 112
        Skipping Options 113 

    Variable Bindings 113
        The Problem with Indirection 113 
        Indirection Workaround 114

    Metrics 115
        Real-World Metrics 115

    Format String Structure 116 

    Orientation 116
        Retrieving Constraints by Axis 117 

    View Names 117
        Superviews 118 

    Connections 118
        Empty Connections 118 
        Standard Spacers 119 
        Numeric Spacers 120 
        Referencing the Superview 120
        Spacing from the Superview Flexible Spaces 122 
        Parentheses 123 
        Negative Numbers 124 
        Priorities 124
        122
        Multiple Views 125

    View Sizes 126

    Format String Components 128 

    Getting It Wrong 130

    NSLog and Visual Formats 131 

    Constraining to a Superview 132

    View Stretching 133

    Constraining Size 134

    Building Rows or Columns 135 

    Matching Sizes 136

    Why You Cannot Distribute Views 137
        How to Pseudo-Distribute Views (Part 1: Equal Centers) 138
        Pseudo-Distributing Views (Part 2: Spacer Views) 140 Exercises 143

    Conclusions 143


# 5 Debugging Constraints 145
    Xcode Feedback 145 
        Development Feedback 
        Compiler Feedback 146
        Runtime 146

    Reading Console Logs 147
        Autosizing Issues Example 147
        Solution: Switch Off Autosizing Translation 148
        Auto Layout Conflicts Example 149
        Solution: Adjusting Priorities 150
        The Nuclear Approach 150
        The Balance Approach 151
        Tracing Ambiguity 151

    Examining Constraint Logs 152
        Alignment Constraint Example 152 
        Standard Spacers Example 153
        Equation-Based Constraint Example 153
        Complex Equation Example 154 
        Multiplier and Constant Example 155

    A Note About Layout Math 155

    Constraint Equation Strings 
    
    Adding Names 159
        Using Nametags 160
        Naming Views 161

    Describing Views 161

    Unexpected Padding Example 164 
    
    The Hugged Image Example 165 

    View Centering Example 166
        Retrieving Referencing Constraints 
    
    Descent Reports 169

    Ambiguity Example 170

    Expanding on Console Dumps Example 172 

    Visualizing Constraints 173
        Automating Visualization 174 

    Launch Arguments 175

    Internationalization 177
        Doubled Strings (iOS/OS X) 177 
        Flipped Interfaces (OS X) 178 
        Flipped Interfaces (iOS) 179

    Profiling Cocoa Layout 181

    Auto Layout Rules of Debugging 183 

    Exercises 183

    Conclusions 184


# 6 Building with Auto Layout 185

    Basic Principles of Auto Layout 185 

    Layout Libraries 186
        Building Libraries 187 

    Planning Interfaces 190

    Building for Modularity 191 

    Updating Constraints 194
        Calling Updates and Animating Changes 195 
        Animating Constraint Changes on OS X 196
        Fading Changes 197

    Designing for Edge Conditions 198 

    Building a View Drawer 200
        Building the Drawer Layout 203 
        Managing Layout for Dragged Views 206
        Dragged Views 207


    Window Boundaries 208 

    Exercises 211 

    Conclusions 211



# 7 Layout Solutions 213
    Table Cells 213
        Auto Layout and Multiple-Height Table Cells 216

    Preserving Image Aspect 217 
    Accordion Sizing 220

    Scroll Views 221
        Scroll Views and Pure Auto Layout 222
        Hybrid Solution 222
        Building a Paged Image Scroll View 223

    Centering View Groups 226

    Custom Multipliers and Random Positions 228 

    Building Grids 231

    Making Room for the Keyboard 233

    Inserting Views at Runtime 236
        Adding iOS Frame and Constraint Overlays 237

    Motion Effects, Dynamic Text, and Containers Exercises 238
    Conclusions 238


# A Answers to Exercises 241
    Chapter 1 241 
    Chapter 2 242 
    Chapter 3 243 
    Chapter 4 245 
    Chapter 5 247 
    Chapter 6 248 
    Chapter 7 249

