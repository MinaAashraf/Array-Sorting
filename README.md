# Sorted-Arr
- Project Summary:
An Assemby program that takes array of numbers from the user, sorts it with one of the three simple algorithms
Bubble Sort, Selection Sort, Insertion Sort (depending on the user desire) and prints the sorted array.

- Project Advantages:
	- Three types of sorting algorithms.
	- Choosing the method of sorting is based on the user desire.
	- The number of values is variable and determined by the user.
	- Handling for inputs such that the user can only enters intergers.
	- The numbers can be sorted ascending or descending.


- Project Contributers:	
	- Name	//					 	   Role //					           Branch Name //
	-	1- Mostafa Mahmoud //				Handling Input validation and representation //  	Input			
	-	2- Mohamed Ali //					Creating Bubble sort algorithm //				Bubble_Sort
	-	4- Mohamed Hany	//				Creating Insertion Sort algorithm //			Insertion_Sort //
	-	5- Mahmoud mohamed  Abdelwahab //				Creating Selection sort algorithm //			election_Sort //
	-	5- Mina Ashraf //					Handling  output after Sorting // 				Master //

	
- Project Language:		Assembly Programming Language 	



- Project Description:
This project is a program takes a set of numbers from user to sort them ascending or descending based upon 
the desire of the user. firstly the program asks the user to enter the number of elements, then the program
asks him to enter the values of numbers. then the program asks the user to choose the sorting method because 
the program supoorts three ways of sorting (Bubble Sort - Selection Sort - Insertion Sort).
	- Bubble Sort Algorithm: 
	
	![image](https://user-images.githubusercontent.com/76550923/103942137-95500580-5138-11eb-9338-bfe50df77a2e.png)
	
		 **EXAMPLE**
	![image](https://user-images.githubusercontent.com/76550923/103942433-0bed0300-5139-11eb-8a22-2ca20e19e3a6.png)
	
	![image](https://user-images.githubusercontent.com/76550923/103942498-27f0a480-5139-11eb-8b10-96c1310b3d56.png)
	
	![image](https://user-images.githubusercontent.com/76550923/103942592-50789e80-5139-11eb-99c6-74233562056c.png)
	
	![image](https://user-images.githubusercontent.com/76550923/103942619-59697000-5139-11eb-9e59-91ffe6db5a8f.png)


	- Insertion Sort Algorithm: 
	
		In this sorting technique, we pick an element and then insert it in the appropriate 
		position in ascending or descending order.

		 **EXAMPLE**
		
	![1](https://user-images.githubusercontent.com/48108210/104019934-1228c100-51c5-11eb-88bc-af0c4a9e2335.png)
		
		In pass 1, element arr[1] is inserted before arr[0], so that arr[0] and arr[1] are sorted.

	![2](https://user-images.githubusercontent.com/48108210/104020179-79467580-51c5-11eb-90e3-84c673ea73b3.png)
	
		In pass 2, element arr[2] is inserted before arr[0] or between arr[0] and arr[1] or after arr[1], 
		so that arr[0], arr[1] and arr[2] are sorted.

	![3](https://user-images.githubusercontent.com/48108210/104020414-dcd0a300-51c5-11eb-9e50-a1af15db08c1.png)
	
	![4](https://user-images.githubusercontent.com/48108210/104020591-202b1180-51c6-11eb-86fd-d410ed00bade.png)
	
		In a similar way the process is carried out n-1 times.

		**Java Code for the algorithm**
	![javacode](https://user-images.githubusercontent.com/48108210/104022566-22429f80-51c9-11eb-8917-b7d2a8647cbb.png)
	
	 - Selection Sort Algorithm: 
	 
	   sorts an array by repeatedly finding the maxmimum element (considering ascending order) 
	   from unsorted part and putting it at the ending .
	   
	   **EXAMPLE**
	   
	   ![1](https://user-images.githubusercontent.com/47304558/104108466-7fc01480-52cd-11eb-9a38-d81ca8e23187.jpg)
	   
	    **Java Code for the algorithm**
	    
	    
	    
          ![code](https://user-images.githubusercontent.com/47304558/104109350-9e2a0e00-52d5-11eb-9926-911f4d78ad42.jpg)

	   
	   
	   
	    
	    The selection sort improves on the bubble sort by reducing  the number of swaps necessary from O(N2 ) to O(N)
	    
	    Time Complexity: O(n2) as there are two nested loops.
	    
	    **Normal Inputs**
	    
	    ![normal inputs](https://user-images.githubusercontent.com/47304558/104109653-d848df00-52d8-11eb-9abd-93519ae91870.jpg)

            




- Project Tools:		Visual studio IDE and Masm 

- External Library:		Irvine32.lib

- Project Referances: playLists, 
		Books:  
		- prentice_the_intel_microprocessors_8th_edition_013 .                                 
		- Assembly language for Intel-based computers by Kip R. Irvine.                             
		- learning git and github https://www.youtube.com/watch?v=ACOiGZoqC8w&list=PLDoPjvoNmBAw4eOj58MZPakHjaO3frVMF.

