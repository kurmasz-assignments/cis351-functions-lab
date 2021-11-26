.globl loc_of_min_runner, selection_sort

.data

array1: .word  9 2 4 3 8 7 6 15 10 5
array2: .word  41 1 22 34 43 51 18 10
array3: .word  71 41 10 6 4 2 3 1 9 8 17

.text

la $a0 array1
li $a1, 10

jal selection_sort

li $v0, 10
syscall

#####################################################################
#
# loc_of_min
#
# Returns a pointer to the minimum value in an array
#
# a0 pointer to first element in the array
# a1 pointer to the last element in the array
# returns *pointer to* minimum element.
#
# Assume that length is >= 1 (i.e., that a1 > a0)
#
#####################################################################
loc_of_min:
	
	
	jr $ra
	
############################################################################
#
# loc_of_min_runner
#
# This function "wraps" loc_of_min so that it is easier to test 
# using the MUnit framework.  
#
# MUnit wraps addresses in Label objects.  Therefore, it is difficult 
# to create two related pointers needed as input for loc_of_min.  
# Therefore, loc_of_min_runner takes a pointer and length as input,
# computes the "end" pointer, and calls loc_of_min.  It also converts
# the return value from loc_of_min into an index.
#		
# $a0 pointer to array
# $a1 length of array
# return index instead of pointer.	
#
#############################################################################
loc_of_min_runner:
	addi $sp, $sp, -8
	sw $ra, 0($sp)
	sw $s0, 4($sp)
	move $s0, $a0
	
	sll $a1, $a1, 2     # convert num elements to num bytes
	add $a1, $a1, $a0
	addi $a1, $a1, -4   # move pointer to the last element of the array
	
	jal loc_of_min
	
	sub $v0, $v0, $s0
	sra $v0, $v0, 2
	
	lw $ra, 0($sp)
	lw $s0, 4($sp)
	addi $sp, $sp, 8
	
	jr $ra
	
	
############################################################################
#
# selection_sort
#
# Sorts an array using the selection sort algorithm.
#
#  $a0 array
#  $a1 length
#
#############################################################################
selection_sort:
	
	jr $ra

				
			
					
