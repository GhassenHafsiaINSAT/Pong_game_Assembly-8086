# AABB Collision Detection

- **Axis-Aligned Bounding Box (AABB) collision detection** is a fundamental concept in game development, particularly for simple 2D games like **Pong**.
  
- An **AABB** is a rectangular box aligned with the coordinate axes, and **checking for collisions** involves determining if a **point** (representing, for example, a corner of another object) **lies within this box**.

### AABB Collision Detection Formula

- To determine if a point $\(P\)$ with coordinates $\((P_x, P_y)\)$ is inside an AABB defined by its minimum coordinates $\( (B_{\text{minX}}, B_{\text{minY}}) \)$ and maximum coordinates $\( (B_{\text{maxX}}, B_{\text{maxY}}) \)$, use the following formula:

$$
f(P, B) = (P_x \geq B_{\text{minX}} \land P_x \leq B_{\text{maxX}}) \land (P_y \geq B_{\text{minY}} \land P_y \leq B_{\text{maxY}}))
$$
